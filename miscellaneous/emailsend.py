import smtplib
import random
import datetime
import string
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText


def verify_link_send(subject, receiver, link, password):
    msg = MIMEMultipart()
    msg['From'] = 'castlelords778@gmail.com'
    msg['To'] = receiver
    msg['subject'] = subject

    body = "Hey User! Your password is %s & your verify link is %s" % (str(password), str(link))
    msg.attach(MIMEText(body, 'plain'))
    server = smtplib.SMTP('smtp.gmail.com', 587)
    server.starttls()
    try:
        server.login('castlelords778@gmail.com', 'hotelmanagement')
        text=msg.as_string()
        server.sendmail(msg['FROM'], msg["To"], text)

        print("email send successful")
        server.quit()
        return True
    except smtplib.SMTPException:
        print("error not sent")
        return False
subject = 'subject of the mail'
receiver = 'sheikhanetmax@gmail.com'
mail= 'welcome here'
# sendmail(subject,receiver,mail)
def gen_otp():
    letters=string.ascii_letters
    otp = random.randint(1,100000)
    otp=str(otp).join(random.choice(letters) for i in range(3))
    time=datetime.datetime.now()
    print(otp,time)
    return otp,time

gen_otp()





