from unittest import TestCase
import mysql.connector
from mysql.connector import errorcode
from mock import patch
import utils


MYSQL_USER = "root"
MYSQL_PASSWORD = "root"
MYSQL_DB = "property_management"
MYSQL_HOST = "localhost"
MYSQL_PORT = "3306"

class TestUtils(TestCase):

    @classmethod
    def setUpClass(cls):
        cnx = mysql.connector.connect(
            host=MYSQL_HOST,
            user=MYSQL_USER,
            password=MYSQL_PASSWORD,
            port = MYSQL_PORT
        )
        cursor = cnx.cursor(dictionary=True)

        # drop database if it already exists
        try:
            cursor.execute("DROP DATABASE {}".format(MYSQL_DB))
            cursor.close()
            print("DB dropped")
        except mysql.connector.Error as err:
            print("{}{}".format(MYSQL_DB, err))

        cursor = cnx.cursor(dictionary=True)
        try:
            cursor.execute(
                "CREATE DATABASE {} DEFAULT CHARACTER SET 'utf8'".format(MYSQL_DB))
        except mysql.connector.Error as err:
            print("Failed creating database: {}".format(err))
            exit(1)
        cnx.database = MYSQL_DB

        query = """CREATE TABLE `accounts` (
        `id` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
        `username` varchar(50) NOT NULL,
        `fullname` varchar(50) NOT NULL,
        `email` varchar(50) NOT NULL,
        `mobile` varchar(10) NOT NULL,
        `password` varchar(255) NOT NULL,
        `cpassword` varchar(255) NOT NULL,
        )"""
        try:
            cursor.execute(query)
            cnx.commit()
        except mysql.connector.Error as err:
            if err.errno == errorcode.ER_TABLE_EXISTS_ERROR:
                print("accounts already exists.")
            else:
                print(err.msg)
        else:
            print("OK")

        insert_data_query = """INSERT INTO `accounts` 
        (`id`,`username`, `fullname`, `email`,`mobile`,`password`,`cpassword`) 
        VALUES ('admin', 'admin', 'admin@gmail.com', '1234567890', 'admin', 'admin')"""
        try:
            cursor.execute(insert_data_query)
            cnx.commit()
        except mysql.connector.Error as err:
            print("Data insertion to test_table failed \n" )
        cursor.close()
        cnx.close()

        testconfig ={
            'host': MYSQL_HOST,
            'user': MYSQL_USER,
            'password': MYSQL_PASSWORD,
            'database': MYSQL_DB
        }
        cls.mock_db_config = patch.dict(utils.config, testconfig)

    @classmethod
    def tearDownClass(cls):
        cnx = mysql.connector.connect(
            host=MYSQL_HOST,
            user=MYSQL_USER,
            password=MYSQL_PASSWORD
        )
        cursor = cnx.cursor(dictionary=True)

        # drop test database
        try:
            cursor.execute("DROP DATABASE {}".format(MYSQL_DB))
            cnx.commit()
            cursor.close()
        except mysql.connector.Error as err:
            print("Database {} does not exists. Dropping db failed".format(MYSQL_DB))
        cnx.close()

    def test_db_read(self):
        with self.mock_db_config:
            self.assertDictEqual(utils.db_read("""SELECT * FROM accounts""")[0], {
                'id': '1',
                'username': 'admin',
                'fullname': 'admin',
                'email': 'admin@gmail.com',
                'mobile': '1234567890',
                'password': 'admin',
                'cpassword': 'admin'
            })

    def test_db_write(self):
        with self.mock_db_config:
            self.assertEqual(utils.db_write("""INSERT INTO accounts 
            (id,username, fullname, email,mobile,password,cpassword) 
            VALUES ('a', 'b', 'a@gmail.com', '1234567899', 'a', 'a')"""), True)
            self.assertEqual(utils.db_write("""DELETE FROM accounts WHERE id='2' """), True)
            self.assertEqual(utils.db_write("""DELETE FROM accounts WHERE id='3' """), True, "Delete non-existent entry" )