from flask import Flask, render_template, request, redirect, url_for, session
import bcrypt
from flask_mysqldb import MySQL
import MySQLdb.cursors
import re
import os, uuid
from werkzeug.utils import secure_filename
from datetime import date, timedelta, datetime

app = Flask(__name__)
app.secret_key='h+\xe1GZ]\x9egB\xcf\xf4\x88_z\x01>'
app.config['MYSQL_HOST'] = 'localhost'
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'root'
app.config['MYSQL_DB'] = 'property_management'

mysql = MySQL(app)

@app.route("/", methods=['GET', 'POST'])
def home():
    if 'loggedin' in session:
        return render_template('home.html', username=session['username'],
                               email1=session['email1'])
    return render_template('home.html',username="",email1="")

@app.route("/login/", methods=['GET', 'POST'])
def login():
    msg = ''
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        if len(username) > 0 and len(password) > 0:
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute('SELECT * FROM accounts WHERE username = %s', (username, ))
            account = cursor.fetchone()
            mysql.connection.commit()
            cursor.close()
            if account and bcrypt.checkpw(password.encode('utf-8'), account['password'].encode('utf-8')):
                if username == 'admin' and password == 'admin':
                    session['loggedin'] = True
                    session['id'] = account['id']
                    session['username'] = account['username']
                    session['email1'] = account['email']
                    session['mobile'] = account['mobile']
                    return redirect(url_for('admindashboard'))
                else:
                    session['loggedin'] = True
                    session['id'] = account['id']
                    session['username'] = account['username']
                    session['email1'] = account['email']
                    session['mobile'] = account['mobile']
                    return redirect(url_for('dashboard'))
            else:
                msg = 'Incorrect username/password!'
        else:
            msg = ' Please fill the entries !'
    return render_template('login.html', msg=msg)


@app.route('/login/logout')
def logout():
    session.pop('loggedin', None)
    session.pop('id', None)
    session.pop('username', None)
    session.pop('email1', None)
    session.pop('mobile', None)
    return redirect(url_for('login'))


@app.route("/register/", methods=['GET', 'POST'])
def register():
    msg = ''
    if request.method == 'POST':
        username = request.form['username']
        fullname = request.form['fullname']
        password = request.form['password']
        email = request.form['email']
        mobile = request.form['mobile']
        cpassword = request.form['cpassword']
        if len(username) > 0 and len(password) > 0 and len(email) > 0 and len(mobile) > 0 and len(fullname) > 0 and len(
                cpassword) > 0:
            cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
            cursor.execute('SELECT * FROM accounts WHERE username = % s', (username,))
            account = cursor.fetchone()
            cursor.execute('SELECT * FROM accounts WHERE email = % s', (email,))
            account1 = cursor.fetchone()
            cursor.execute('SELECT * FROM accounts WHERE mobile = % s', (mobile,))
            account2 = cursor.fetchone()
            if account:
                msg = 'Account already exists with this username!'
            elif account1:
                msg = 'Account already exists with this email !'
            elif account2:
                msg = 'Account already exists with this mobile number !'
            elif not re.match(r'[^@]+@[^@]+\.[^@]+', email):
                msg = 'Invalid email address !'
            elif not re.match(r'[A-Za-z0-9]+', username):
                msg = 'Username must contain only characters and numbers !'
            elif not username or not password or not email or not mobile or not cpassword or not fullname:
                msg = 'Please fill out the form !'
            elif len(mobile) != 10:
                msg = 'Enter 10 digit number !'
            elif cpassword != password:
                msg = 'Confirm password does not match with password !'
            else:
                hashed = bcrypt.hashpw(password.encode('utf-8'), bcrypt.gensalt())
                cursor.execute('INSERT INTO accounts VALUES (NULL, % s, % s, % s,% s,% s,% s)',
                               (username, fullname, email, mobile, hashed, hashed,))
                mysql.connection.commit()
                cursor.close()
                msg = 'You have successfully registered !'
        else:
            msg = 'Please fill out the form !'

    return render_template('register.html', msg=msg)


@app.route("/admindashboard", methods=['GET', 'POST'])
def admindashboard():
    if 'loggedin' in session:
        cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
        cursor.execute('SELECT * FROM accounts')
        count = cursor.fetchall()
        cursor.execute('SELECT * FROM apartmentdetail')
        counta = cursor.fetchall()
        mysql.connection.commit()
        cursor.close()
        return render_template('admindashboard.html', count=len(count)-1, counta= len(counta), username='admin', email1=session['email1'])
    return redirect(url_for('login'))


@app.route("/dashboard", methods=['GET', 'POST'])
def dashboard():
    if 'loggedin' in session:
        return render_template('userdashboard.html', username=session['username'], email1=session['email1'])
    return redirect(url_for('login'))


@app.route("/apmt_reg/", methods=['GET', 'POST'])
def apmt_reg():
    msg = ''
    if request.method == 'POST':
        # fetch data
        details = request.form
        apmtname = details['name']
        plot_no = details['Plot']
        area = details['Area']
        address = details['Address']
        landmark = details['Landmark']
        city = details['City']
        pin = details['Pincode']
        state = details['State']
        country = details['Country']
        atype = details['Atype']
        rs = details['Rent/Sale']
        availability = details['Availability']
        Price = details['Price']
        facilities = details['Facilities']
        description = details['Description']
        file = request.files['file']
        filename = secure_filename(file.filename)
        extension = os.path.splitext(filename)
        allowed_extensions = {'.jpg', '.png', '.jpeg'}
        if extension[1] in allowed_extensions:
            f_name = str(uuid.uuid4()) + str(extension[1])
            app.config['UPLOAD_FOLDER'] = 'static/Uploads'
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], f_name))
            if len(apmtname) > 0 and len(plot_no) > 0 and len(address) > 0 and len(landmark) > 0 and len(availability) and len(
                city) > 0 and len(pin) > 0 and len(state) > 0 and len(country) > 0 and len(rs)>0 and len(
                atype) > 0 and len(area)>0 and len(facilities) > 0 and len(description) > 0 and len(Price)>0:

                if len(pin) != 6:
                    msg = 'Enter 6 digit Pincode !'
                elif not apmtname or not plot_no or not area or not address or not landmark or not city or not pin or not state or not country or not atype or not rs or not availability or not Price or not facilities or not description or not file:
                    msg = 'Please fill out the form !'
                else:
                    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
                    cursor.execute(
                        "INSERT INTO apartmentdetail VALUES(NULL, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                        (
                            session['id'] , apmtname, plot_no, area, address, landmark, city, pin, state, country, atype, rs, availability,
                            Price, facilities, description, f_name))
                    mysql.connection.commit()
                    cursor.close()
                    msg = 'Registration Successful! Thank You !'
            else:
                msg = 'Please fill out the form !'
        else:
            msg = 'Upload image in jpg/png/jpeg format only!'
    if 'loggedin' in session:
        return render_template('Apmt_reg.html', msg=msg, username=session['username'], email1=session['email1'])
    else:
        return redirect(url_for('login'))


@app.route("/roomreg/", methods=['GET', 'POST'])
def roomreg():
    msg = ''
    if request.method == 'POST':
        # fetch data
        details = request.form
        bname = details['name']
        room_no = details['room']
        area = details['Area']
        address = details['Address']
        landmark = details['Landmark']
        city = details['City']
        pin = details['Pincode']
        state = details['State']
        country = details['Country']
        availability = details['Availability']
        Rent = details['Price']
        facilities = details['Facilities']
        description = details['Description']
        file = request.files['file']
        filename = secure_filename(file.filename)
        extension = os.path.splitext(filename)
        allowed_extensions = {'.jpg', '.png', '.jpeg'}
        if extension[1] in allowed_extensions:
            f_name = str(uuid.uuid4()) + str(extension[1])
            app.config['UPLOAD_FOLDER'] = 'static/Uploads'
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], f_name))
            if len(bname) > 0 and len(room_no) > 0 and len(area) and len(address) > 0 and len(landmark) > 0 and len(
                city) > 0 and len(pin) > 0 and len(state) > 0 and len(country) > 0 and len(availability) and len(
                Rent)>0 and len(facilities) > 0 and len(description) > 0:

                if len(pin) != 6:
                    msg = 'Enter 6 digit Pincode !'
                elif not bname or not room_no or not area or not address or not landmark or not city or not pin or not state or not country or not availability or not Rent or not facilities or not description or not file:
                    msg = 'Please fill out the form !'
                else:
                    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
                    cursor.execute(
                        "INSERT INTO roomdetail VALUES(NULL, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                        (
                            session['id'], bname, room_no, area, address, landmark, city, pin, state, country, availability,
                            Rent, facilities, description, f_name))
                    mysql.connection.commit()
                    cursor.close()
                    msg = 'Registration Successful! Thank You !'
            else:
                msg = 'Please fill out the form !'
        else:
            msg = 'Upload image in jpg/png/jpeg format only!'
    if 'loggedin' in session:
        return render_template('roomreg.html', msg=msg, username=session['username'], email1=session['email1'])
    else:
        return redirect(url_for('login'))



@app.route("/projectreg/", methods=['GET', 'POST'])
def projectreg():
    msg = ''
    if request.method == 'POST':
        # fetch data
        details = request.form
        pname = details['name']
        flat = details.getlist('flattype')
        print(flat)
        flattype = ', '.join(flat)
        address = details['Address']
        city = details['City']
        pin = details['Pincode']
        state = details['State']
        country = details['Country']
        facility = details.getlist('Facilities')
        facilities = ', '.join(facility)
        feature = details.getlist('features')
        features = ', '.join(feature)
        availability = details['Availability']
        description = details['Description']
        file = request.files['file']
        filename = secure_filename(file.filename)
        extension = os.path.splitext(filename)
        allowed_extensions = {'.jpg', '.png', '.jpeg'}
        if extension[1] in allowed_extensions:
            f_name = str(uuid.uuid4()) + str(extension[1])
            app.config['UPLOAD_FOLDER'] = 'static/Uploads'
            file.save(os.path.join(app.config['UPLOAD_FOLDER'], f_name))
            if len(pname) > 0 and len(flattype) > 0 and len(address) > 0 and len(features) > 0 and len(
                city) > 0 and len(pin) > 0 and len(state) > 0 and len(country) > 0 and len(
                availability) > 0 and len(facilities) > 0 and len(description) > 0:

                if len(pin) != 6:
                    msg = 'Enter 6 digit Pincode !'
                elif not pname or not flattype or not features or not address or not city or not pin or not state or not country or not availability or not facilities or not description or not file:
                    msg = 'Please fill out the form !'
                else:
                    cursor = mysql.connection.cursor(MySQLdb.cursors.DictCursor)
                    cursor.execute(
                        "INSERT INTO projectdetail VALUES(NULL, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)",
                        (
                            session['id'], pname, flattype, address, features, city, pin, state, country, availability,
                            facilities, description, f_name))
                    mysql.connection.commit()
                    cursor.close()
                    msg = 'Registration Successful! Thank You !'
            else:
                msg = 'Please fill out the form !'
        else:
            msg = 'Upload image in jpg/png/jpeg format only!'
    if 'loggedin' in session:
        return render_template('projectreg.html', msg=msg, username=session['username'], email1=session['email1'])
    else:
        return redirect(url_for('login'))




@app.route("/registeredusers/")
def registeredusers():
    if 'loggedin' in session:
        if session['username']=='admin':
            cur = mysql.connection.cursor()
            cur.execute("SELECT * FROM accounts where username <> 'admin' ")
            userDetails = cur.fetchall()
            mysql.connection.commit()
            cur.close()
            return render_template('registeredusers.html', userDetails=userDetails, username=session['username'],
                                   email1=session['email1'])
        else:
            return render_template('home.html')
    else:
        return render_template('login.html')

@app.route("/deleteuser/<string:id>")
def deleteuser(id):
    cursor = mysql.connection.cursor()
    cursor.execute("DELETE FROM accounts where ID=%s", [id, ])
    mysql.connection.commit()
    cursor.close()
    return redirect(url_for('registeredusers'))

app.run(debug=True)