# 🏚️ Property-Management

The **Property Management** website is designed to provide the facility to a user to buy or sell/rent his properties
such as apartments and rooms also to add and apply for projects.

## Instructions For Project Setup

- **Step 1.**
You can directly download the zip file or follow next 2 steps to clone the repo.
Install latest version of git. Open the above github repository link in browser. Click on the code button as shown in the figure and copy the marked https url (shown in the figure).

![image](https://user-images.githubusercontent.com/64724039/117947173-91720100-b32d-11eb-9b54-ce51b91b5640.png)

- **Step 2.**
Create new folder and open git bash inside that folder write command-
```
git clone https://github.com/anjali7786/Property-Management.git
```
- **Step 3.**
  - Install latest version of python and a code editor (Pycharm or Visual Studio Code).
  - Download & Install MYSQLCLIENT For Python : https://www.lfd.uci.edu/~gohlke/pythonlibs/#mysqlclient open this link and under MySQLclient select the wheel according to your python version and 32/64 bit windows system. 
  - After installing the wheel Open command prompt inside that folder. To open a command prompt window in any folder, simply hold down the Shift key and right-click on the desktop. In the context menu, you will see the option to Open command window here. Clicking on it will open a CMD window.
  
  ![image](https://user-images.githubusercontent.com/64724039/117949549-da2ab980-b32f-11eb-8a26-13178b05864e.png)

  - And write the below command in cmd.

  ![image](https://user-images.githubusercontent.com/64724039/117949687-03e3e080-b330-11eb-8269-d233634fd7c8.png)

- **Step 4.**
   Create a local host connection and click on Server Tab then select Data Import. You can see that there are two options import from self-contained file and import from dump project folder choose the option import from self-contained file and browse to the location where the **property_management.sql** file is present and click on start import which is on the bottom right of this window. Then go to the schemas tab and click on refresh to
   see the new database named **property_management** added. The database setup is completed.

   ![image](https://user-images.githubusercontent.com/64724039/117950541-ea8f6400-b330-11eb-8820-3c5e31ed1eae.png)

- **Step 5.**
   Open the project files in the code editor. Open `main.py` file and if your MySQL username and password are not **root** then you can replace the username and password written in `main.py` file with your MySQL username and password.

- **Step 6.**
  **Installing Packages**

  For Visual Studio Code do the following:
   - Open **New Terminal**

    ![image](https://user-images.githubusercontent.com/64724039/117951623-f7f91e00-b331-11eb-8c7a-2baba835b685.png)

   - And now run the following commands in the terminal:
    ```
    python -m venv env
    Set-ExecutionPolicy Unrestricted -Scope Process
    env\scripts\activate
    pip install flask
    $env:FLASK_APP = "main"
    pip install bcrypt
    pip install flask_mysqldb
    pip install flask_mail
    flask run
    ```
   - Or run `requirements.txt` file :
    ```
    pip install -r requirements.txt
    ```
  For Pycharm code editor do the following:
   - Open the terminal
    
    ![image](https://user-images.githubusercontent.com/64724039/117953503-b2d5eb80-b333-11eb-9a21-f9f08cda86bb.jpg)

   - And run the following commands:
    ```
    pip install flask
    pip install bcrypt
    pip install flask_mysqldb
    pip install flask_mail
    ```
   - Or run `requirements.txt` file :
    ```
    pip install -r requirements.txt
    ```
   - Now run the main.py file and click on the localhost link of the project or go to http://127.0.0.1:5000/ to see  the project.

## Snapshots

- Homepage

![home](https://user-images.githubusercontent.com/64724039/117958758-f848e780-b338-11eb-8987-50c6a271c075.jpeg)

- Login page

![login](https://user-images.githubusercontent.com/64724039/117958969-2e866700-b339-11eb-9222-1ee6938981b1.jpeg)

- Sign Up page

![SignUp](https://user-images.githubusercontent.com/64724039/117959099-4fe75300-b339-11eb-96ec-d3b7efb0e264.jpeg)

- Apartment Registeration

![apartment reg](https://user-images.githubusercontent.com/64724039/117959333-86bd6900-b339-11eb-8a80-a854877c330a.jpeg)

- Own Property Details page for Projects, similar pages are for apartments and rooms also.

![ownerproperty](https://user-images.githubusercontent.com/64724039/117959610-d0a64f00-b339-11eb-842a-19d3c6c46f17.jpeg)

- Search Page
   
   ![search1](https://user-images.githubusercontent.com/64724039/117959979-2aa71480-b33a-11eb-91e1-70d9b298ea84.jpeg)

   ![search apartments](https://user-images.githubusercontent.com/64724039/117960137-532f0e80-b33a-11eb-9297-82d6df68c5d5.jpeg)

   ![search rooms](https://user-images.githubusercontent.com/64724039/117960238-6e018300-b33a-11eb-95ab-898f4be29edf.jpeg)

   ![search projects](https://user-images.githubusercontent.com/64724039/117960350-86719d80-b33a-11eb-97c0-0b21e8078238.jpeg)

   ![search result 1](https://user-images.githubusercontent.com/64724039/117960755-f4b66000-b33a-11eb-926f-f6ab131356ff.jpeg)

   ![search result2](https://user-images.githubusercontent.com/64724039/117960898-1f081d80-b33b-11eb-9070-c224fff44d4a.jpeg)

   ![search result3](https://user-images.githubusercontent.com/64724039/117960981-37783800-b33b-11eb-86bc-066843e30f87.jpeg)

   ![search result4](https://user-images.githubusercontent.com/64724039/117961072-4d85f880-b33b-11eb-9e34-b581eb7c0bbb.jpeg)

- Followers Following Page: user can see his followers and the his friends.

![follower-following](https://user-images.githubusercontent.com/64724039/117961169-70181180-b33b-11eb-8ce1-c22372044699.jpeg)

- Members page: user can see other registered users.

![members](https://user-images.githubusercontent.com/64724039/117961620-f3d1fe00-b33b-11eb-8bcc-3a56fc832a2a.jpeg)

- Save Apartment page, similar pages are there for rooms and projects also. User can view their saved properties.

![savedproperties](https://user-images.githubusercontent.com/64724039/117961815-2aa81400-b33c-11eb-8eb4-26854675f655.jpeg)

- Applied Rooms page,similar pages are there for rooms and projects also. User can view all the properties they have applied.

![appliedrooms](https://user-images.githubusercontent.com/64724039/117961872-3c89b700-b33c-11eb-9f9d-385bfc2941e8.jpeg)

- Apply project form,similar pages are there for rooms and projects also. The name shown in the form is fetched from the database.

![apply property](https://user-images.githubusercontent.com/64724039/117962412-d18cb000-b33c-11eb-80a1-16c5862e3b27.jpeg)

- Book A Meet form,similar pages are there for rooms and projects also. The readonly filled details shown in the form are fetched from the database.

![book a meet](https://user-images.githubusercontent.com/64724039/117962657-187aa580-b33d-11eb-9cc9-ae7bd535e83a.jpeg)

- Complaints Form,similar pages are there for apartments and projects also. User can register complaints for properties.

![complaints room form](https://user-images.githubusercontent.com/64724039/117962948-714a3e00-b33d-11eb-869e-244514fbea29.jpeg)

- Friends Applied property page, similar pages are there for other type of properties. User can view the properties applied by their friends.

![friends applied apart](https://user-images.githubusercontent.com/64724039/117963168-a9518100-b33d-11eb-98d1-20e745412720.jpeg)

- Meet Requested to owner Page for properties.

![meet request](https://user-images.githubusercontent.com/64724039/117963579-31378b00-b33e-11eb-96d0-b03b2b8a73b0.jpeg)

- Accept Meet form, similar pages are there for other type of properties also. The enteries shown are fetched from the database and are readonly.

![accept a meet](https://user-images.githubusercontent.com/64724039/117967665-ec622300-b342-11eb-9d20-841476737d1e.jpeg)

- Approve Property page, owner can approve the applicantions.

  ![approve property page](https://user-images.githubusercontent.com/64724039/117963921-9db28a00-b33e-11eb-9c05-8d5ad09d66f8.jpeg)

  ![approve2](https://user-images.githubusercontent.com/64724039/117964056-caff3800-b33e-11eb-98db-f6c98cd8f5b7.jpeg)

- Approved Properties page for applicants showing that their application for applying that property has been approved and now they can provide rating also.

![approve 3](https://user-images.githubusercontent.com/64724039/117964199-f41fc880-b33e-11eb-942f-4056d46b146d.jpeg)

- Rating Form, similar pages are there for other type of properties also.

![rating form](https://user-images.githubusercontent.com/64724039/117964422-377a3700-b33f-11eb-8d51-e0a0617508f4.jpeg)

- Admin Dashboard Page, admin can view all the links for other pages,his details,, all the notifications, number of complaints registered, number of users registered, numbers of apartments, rooms and projects registered. All these details are fetched from the database.

![admin dashboard](https://user-images.githubusercontent.com/64724039/117964519-54af0580-b33f-11eb-97b6-1b5fc3ad9a6a.jpeg)


- Registered Users

![registered users](https://user-images.githubusercontent.com/64724039/117964851-c2f3c800-b33f-11eb-9cd6-2efaffb9762b.jpeg)

- Property Details page for admin, similar pages are there for other type of properties also.

![admin property details](https://user-images.githubusercontent.com/64724039/117965161-1239f880-b340-11eb-9afa-1af523ad6807.jpeg)

- Edit details form for property, similar pages are there for other type of properties also. The enteries shown in the form are fetched from the database.

![edit details property](https://user-images.githubusercontent.com/64724039/117966123-2e8a6500-b341-11eb-8605-2ad74b2db8f1.jpeg)

- Complaints Details for properties page for admin

![Complaints detail admin](https://user-images.githubusercontent.com/64724039/117965363-4f9e8600-b340-11eb-9d52-8499c802b415.jpeg)

- User Dashboard page, user can view all the links for other pages,his details,, all the notifications, numbers of apartments, rooms and projects registered by them. All these details are fetched from the database.

![userdashboard](https://user-images.githubusercontent.com/64724039/117965562-88d6f600-b340-11eb-97f0-73db4b255c63.jpeg)

- Contact Us Form Page

![contact us](https://user-images.githubusercontent.com/64724039/117965781-c8054700-b340-11eb-8109-d611a8b0abc5.jpeg)

- Contact Us messages to admin page

![contactus messages](https://user-images.githubusercontent.com/64724039/117965894-ebc88d00-b340-11eb-9332-91e29e2407f5.jpeg)

- Mail sent to user

![mail user](https://user-images.githubusercontent.com/64724039/117966014-0f8bd300-b341-11eb-8595-3da93684727e.jpeg)

- Mail sent to admin

![mail admin](https://user-images.githubusercontent.com/64724039/117966490-9476ec80-b341-11eb-9010-9ae76e45feed.jpg)
