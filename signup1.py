import mysql.connector
con= mysql.connector.connect(host="localhost",user="hotel_management" ,password="hotelmanagement",database="user_signup")
sql=con.cursor()


def create_database(db_name):
    sql.execute("CREATE DATABASE IF NOT EXISTS  "+db_name)


create_database("user_signup")
print("database created")

sql.execute("USE user_signup ")
def create_table(db_new):
    sql.execute("CREATE TABLE IF NOT EXISTS  "+ db_new +"(emailid varchar(20) primary key, firstname varchar(20), lastname varchar(20), name varchar(30),password varchar(59) , city varchar(40) , country varchar(20) , state varchar(45))")

    print("table created")


# create_table("signup1")

def insert(emailid,firstname,lastname,name,password,city,country,state):
    sql.execute("INSERT"
                " INTO signup (emailid,firstname,lastname,name,password,city, country, state)values('%s','%s','%s','%s','%s','%s','%s','%s')"%(emailid,firstname,lastname,name,password,city,country,state))
    con.commit()
    print("data inserted")
def data():
    emailid = input("enter email id")
    fname = input("enter first name")
    lname = input("enter lastname")
    fulname = input("enter fullname")
    password = input("enter password")
    city = input("enter city")
    country = input("enter country")
    state = input("enter state")
    insert(emailid, fname, lname, fulname, password, city, country, state)
    print("signup successfully")


data()
while True:
    print("please login")
    email = input("Enter your email id")
    pwd = input("Enter your password")
    sql.execute("SELECT * from signup where emailid='%s'"%(email))
    data = sql.fetchall()
    if(len(data)>0):
        if(data[0][0]==email and data[0][4]==pwd):
                print("Login successfull")
                print("\n")
                print("Welcome, "+data[0][3],"your Account details are ")
                break
    else:
        print("Data is not correct please enter correct data")
        continue
sql.execute("SELECT * from signup where emailid='%s'"%(email))
data1 = sql.fetchall()
print("EMAIL_ID=",data1[0][0])
print("FIRST_NAME=",data1[0][1])
print("LAST_NAME=",data1[0][2])
print("FULL_NAME=",data1[0][3])
print("PASSWORD=",data1[0][4])
print("CITY=",data1[0][5])
print("COUNTRY=",data1[0][6])
print("STATE=",data1[0][7])