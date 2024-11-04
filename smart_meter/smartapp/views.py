import json
from datetime import datetime

import cv2
from django.contrib import auth
from django.contrib.auth.decorators import login_required

from django.core.files.storage import FileSystemStorage
from django.http import HttpResponse
from django.shortcuts import render
from smartapp.models import *
import pytesseract
from PIL import Image


def log(request):
    return render(request,'loginindex1.html')

def logout(request):
    auth.logout(request)
    return render(request,'loginindex1.html')


def loginn(request):
    uname = request.POST['username']
    pswd = request.POST['Password']
    try:
        ob = Login.objects.get(Username=uname,Password=pswd)
        if ob.Type =="admin":
            ob1=auth.authenticate(username='admin', password='123')
            if ob1 is not None:
                auth.login(request,ob1)
                request.session['lid']=ob.id
            return HttpResponse('''<script>alert('Welcome');window.location='adminhome'</script>''')
        elif ob.Type =="authority":
            ob1 = auth.authenticate(username='admin', password='123')
            if ob1 is not None:
                auth.login(request, ob1)
            request.session['lid']=ob.id
            return HttpResponse('''<script>alert('Welcome');window.location='authorityhome'</script>''')
    except:
        return HttpResponse('''<script>alert('Invalid Username or Password');window.location='/'</script>''')

def adminhome(request):
    return render(request,'adminindex.html')


@login_required(login_url='/')
def addauthority(request):
    return render(request, 'add authority.html')


@login_required(login_url='/')
def addedauthority(request):
    name = request.POST['textfield']
    phone = request.POST['textfield2']
    place = request.POST['textfield3']
    email = request.POST['textfield6']
    des = request.POST['textfield34']
    img = request.FILES['file']
    fs=FileSystemStorage()
    print(img.name,"=========================================")
    print(type(img))
    fn=fs.save(img.name,img)
    uname = request.POST['textfield5']
    pswd = request.POST['textfield4']
    ob=Login()
    ob.Username=uname
    ob.Password=pswd
    ob.Type='authority'
    ob.save()
    uob=Authority()
    uob.LOGIN=ob
    uob.Name=name
    uob.Designation=des
    uob.Phone=phone
    uob.Place=place
    uob.Email=email
    uob.Image=fn
    uob.save()
    return HttpResponse('''<script>alert('success');window.location='manageauthority'</script>''')

@login_required(login_url='/')
def addbill(request):
    ob=User.objects.all()
    return render(request,'add bill.html',{"val":ob})

@login_required(login_url='/')
def addedbill(request):
    uid = request.POST['select']
    uu = request.POST['textfield2']
    reading = request.POST['textfield3']
    ld = request.POST['textfield']
    amt = request.POST['textfield5']
    ob=Bill()
    ob.USER=User.objects.get(id=uid)
    ob.Unit_used=uu
    ob.Reading=reading
    ob.Last_date=ld
    ob.Amount=amt
    ob.Status='pending'
    ob.save()
    return HttpResponse('''<script>alert('added');window.location='managebill'</script>''')


@login_required(login_url='/')
def deleteauthority(request,id):
    ob=Login.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('Deleted');window.location='/manageauthority'</script>''')



@login_required(login_url='/')
def editauthority(request,id):
    ob=Authority.objects.get(id=id)
    request.session['athid']=id
    return render(request,'edit authority.html',{'val':ob})



@login_required(login_url='/')
def updateauthority(request):
    try:
        uob=Authority.objects.get(id=request.session['athid'])
        name = request.POST['textfield']
        phone = request.POST['textfield2']
        place = request.POST['textfield3']
        email = request.POST['textfield6']
        des = request.POST['textfield34']
        img = request.FILES['file']
        fs = FileSystemStorage()
        print(img.name, "=========================================")
        print(type(img))
        fn = fs.save(img.name, img)
        uob.Name = name
        uob.Phone = phone
        uob.Place = place
        uob.Email = email
        uob.Designation=des

        uob.Image = fn
        uob.save()
        return HttpResponse('''<script>alert('successfully edited');window.location='manageauthority'</script>''')
    except:
        uob = Authority.objects.get(id=request.session['athid'])
        name = request.POST['textfield']
        phone = request.POST['textfield2']
        place = request.POST['textfield3']
        email = request.POST['textfield6']
        des = request.POST['textfield34']
        # img = request.FILES['file']
        # fs = FileSystemStorage()
        # print(img.name, "=========================================")
        # print(type(img))
        # fn = fs.save(img.name, img)
        uob.Name = name
        uob.Phone = phone
        uob.Place = place
        uob.Email = email
        uob.Designation = des

        # uob.Image = fn
        uob.save()
        return HttpResponse('''<script>alert('successfully edited');window.location='manageauthority'</script>''')




@login_required(login_url='/')
def addnotification(request):
    return render(request,'add notification.html')



@login_required(login_url='/')
def deletenotification(request,id):
    ob=Notification.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('Deleted');window.location='/notification'</script>''')


@login_required(login_url='/')
def insertnotification(request):
    n=request.POST['textfield']
    ob=Notification()
    ob.AUTHORITY=Authority.objects.get(LOGIN__id=request.session['lid'])
    ob.Notification=n
    ob.Date=datetime.today()
    ob.status='pending'
    ob.save()
    return HttpResponse('''<script>alert('added');window.location='notification'</script>''')



@login_required(login_url='/')
def adminhome(request):
    return render(request,'adminindex.html')



@login_required(login_url='/')

def authorityhome(request):
    return render(request,'authorityindex.html')

@login_required(login_url='/')

def manageauthority(request):
    ob=Authority.objects.all()
    return render(request,'manage autority.html',{"val":ob})
@login_required(login_url='/')

def searchauthority(request):
    s=request.POST['textfield']
    ob=Authority.objects.filter(Name__startswith=s)
    return render(request,'manage autority.html',{"val":ob,"s":s})
@login_required(login_url='/')

def managebill(request):
    ob=Bill.objects.all()
    return render(request,'managebill.html',{"val":ob})
@login_required(login_url='/')


def deletebill(request,id):
    ob=Bill.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('Deleted');window.location='/managebill'</script>''')
@login_required(login_url='/')

def editbill(request,id):
    ob=Bill.objects.get(id=id)
    request.session['billid'] = id
    ob1=User.objects.all()
    return render(request,'edit bill.html',{'val':ob,'val1':ob1})
@login_required(login_url='/')

def updatebill(request):
    bob=Bill.objects.get(id=request.session['billid'])
    uid = request.POST['select']
    uu = request.POST['textfield2']
    reading = request.POST['textfield3']
    ld = request.POST['textfield']
    amt = request.POST['textfield5']


    bob.USER = User.objects.get(id=uid)
    bob.Unit_used = uu
    bob.Reading = reading
    bob.Last_date = ld
    bob.Amount = amt
    bob.Status = 'pending'
    bob.save()
    return HttpResponse('''<script>alert('successfully edited');window.location='managebill'</script>''')
@login_required(login_url='/')


def searchmanagebill(request):
    s=request.POST['textfield']
    ob=Bill.objects.filter(USER__Name__startswith=s)
    return render(request,'managebill.html',{"val":ob,"s":s})
@login_required(login_url='/')


def notification(request):
    ob=Notification.objects.all()
    return render(request,'notification.html',{"val":ob})
@login_required(login_url='/')


def searchnotification(request):
    s = request.POST.get('textfield')
    ob = Notification.objects.filter(Date=s)
    return render(request, 'notification.html', {"val": ob, "s": s})
@login_required(login_url='/')



def paymenthistory(request):
    ob=Payment.objects.all()
    return render(request,'payment history.html',{"val":ob})
@login_required(login_url='/')

def sendreply(request):
    return render(request,'send reply.html')
@login_required(login_url='/')

def insertreply(request):
    r=request.POST['textfield']
    com=request.POST['textfield']
    ob=Complaint()
    ob.AUTHORITY=Authority.objects.get(LOGIN__id=request.session['lid'])
    ob.Complaint=com
    ob.Reply=r
    ob.Date=datetime.today()
    ob.save()
    return HttpResponse('''<script>alert('added');window.location='sendreply'</script>''')
@login_required(login_url='/')



def verifyusers(request):
    ob=User.objects.all()
    return render(request,'verify users.html',{"val":ob})
@login_required(login_url='/')



def searchuser(request):
    s=request.POST['textfield']
    ob=User.objects.filter(Name__startswith=s)
    return render(request,'verify users.html',{"val":ob,"s":s})
@login_required(login_url='/')


def viewbilldetails(request):
    ob=Bill.objects.all()
    return render(request,'view bill details.html',{"val":ob})
@login_required(login_url='/')

def searchbill(request):
    s=request.POST['textfield']
    ob=Bill.objects.filter(USER__Name__startswith=s)
    return render(request,'view bill details.html',{"val":ob,"s":s})
@login_required(login_url='/')



def viewbills(request):
    ob=Bill.objects.all()
    return render(request,'view bills.html',{"val":ob} )
@login_required(login_url='/')

def viewcomplaintandreply(request):
    ab=Complaint.objects.all()
    return render(request,'view complaint&view reply.html', {"val":ab})

@login_required(login_url='/')

def searchcomplaint(request):
    s = request.POST.get('textfield')
    ob = Complaint.objects.filter(Date=s)
    return render(request, 'view complaint&view reply.html', {"val": ob, "s": s})

@login_required(login_url='/')

def viewcomplaint(request):
    ab=Complaint.objects.all()
    return render(request,'view complaint.html',{"val":ab})
@login_required(login_url='/')

def searchviewcomplaint(request):
    s = request.POST.get('textfield')
    ob = Complaint.objects.filter(Date=s)
    return render(request, 'view complaint.html', {"val": ob, "s": s})


@login_required(login_url='/')

def viewfeedback(request):
    ob=Feedback.objects.all()
    return render(request,'view feedback.html',{"val":ob})
@login_required(login_url='/')

def searchfeedback(request):
    s = request.POST.get('textfield')
    ob = Feedback.objects.filter(Date=s)
    return render(request,'view feedback.html', {"val": ob, "s": s})

@login_required(login_url='/')

def viewprofile(request):
    ob=Authority.objects.get(LOGIN__id=request.session['lid'])
    return render(request,'View profile.html',{"val":ob})

@login_required(login_url='/')

def viewuser(request):
    return render(request,'view user.html')

@login_required(login_url='/')

def adextrausage(request):
    return render(request,'ad extrausage.html')
@login_required(login_url='/')

def adviewemergency(request):
    return render(request,'ad view emergency.html')

@login_required(login_url='/')

def extrausage(request):
    return render(request,'extra usage.html')
@login_required(login_url='/')

def sendupdation(request):
    return render(request, 'send updation.html')
@login_required(login_url='/')

def viewemergency(request):
    return render(request,'view emergency.html')
@login_required(login_url='/')

def adviewfeedback(request):
    ob=Feedback.objects.all()
    return render(request,'ad view feedback.html',{"val":ob})

@login_required(login_url='/')

def searchdate(request):
    s = request.POST.get('textfield')
    ob = Feedback.objects.filter(Date=s)
    return render(request, 'ad view feedback.html', {"val": ob, "s": s})

def register(request):
    return render(request,'register.html')
@login_required(login_url='/')

def adminnotification(request):
    ob=Notification.objects.all()
    return render(request, 'admin notification.html',{"val": ob})

@login_required(login_url='/')

def acceptnotification(request,id):
    ob=Notification.objects.get(id=id)
    ob.status='accept'
    ob.save()
    return HttpResponse('''<script>alert('Accepted');window.location='/adminnotification'</script>''')


@login_required(login_url='/')

def declinenotification(request,id):
    ob=Notification.objects.get(id=id)
    ob.status='decline'
    ob.save()
    return HttpResponse('''<script>alert('Declined');window.location='/adminnotification'</script>''')




################ Android ###################

def and_logincode(request):
    un=request.POST['username']
    pswd=request.POST['password']
    print("==",un,"--",pswd)
    try:
        ob = Login.objects.get(Username=un,Password=pswd,Type='User')
        if ob is None:
            data = {"task" : "invalid" }
        else:
            data = {"task" : "valid","lid":ob.id}
        l = json.dumps(data)
        return HttpResponse(l)
    except:
        data ={"task" : "invalid" }
        l = json.dumps(data)
        return HttpResponse(l)

def view_profile(request):
    uid = request.POST['lid']
    print(uid,"HHHHHHHHHHHHHHHHHHHHHHH")
    i = User.objects.get(LOGIN=uid)
    data = []
    # print(ob,"HHHHHHHHHHHHHHHH")

    user = {"task":"valid","Fname":i.Name, "Lname":i.Lname,"Post":i.Post,"Place":i.Place, "Pin":i.Pin, "Phone":i.Phone ,"Email":i.Email,"Consumer_no":i.Consumer_no}

    print(data,"NNNNNNNNNNNNNNN")
    l = json.dumps(user)
    return HttpResponse(l)

def Register(request):
    uname=request.POST['username']
    pswd=request.POST['password']
    fname = request.POST['fname']
    lname = request.POST['lname']
    phone = request.POST['phone']
    place = request.POST['place']
    pin=request.POST['pin']
    post=request.POST['post']
    email = request.POST['email']
    consumer_no = request.POST['consumer_no']

    ob = Login()
    ob.Username=uname
    ob.Password=pswd
    ob.Type='User'
    ob.save()

    uob=User()
    uob.Name=fname
    uob.Lname=lname
    uob.Phone=phone
    uob.Place=place
    uob.Pin=pin
    uob.Post=post
    uob.Email=email
    uob.LOGIN_id=ob.id
    uob.Consumer_no=consumer_no
    uob.save()
    data={'task':"valid"}
    l = json.dumps(data)
    return HttpResponse(l)


def view_bill(request):
    bid = request.POST['lid']
    print(bid,"HHHHHHHHHHHHHHHHHHHHHHH")
    ob = Bill.objects.filter(Bill__USER_id=bid)
    data = []
    print(ob,"HHHHHHHHHHHHHHHH")
    for i in ob:
        bill = {"Username":i.Username, "Unit_used":i.Unit_used, "Consumer_no":i.Consumer_no ,"Reading":i.Reading,
               "Status":i.Status, "Lastdate":i.Last_date,"Amount":i.Amount}
        data.append(bill)
        print(data,"NNNNNNNNNNNNNNN")
    l = json.dumps(data)
    return HttpResponse(l)

def view_notification(request):
    # nid = request.POST['lid']
    # print(nid,"HHHHHHHHHHHHHHHHHHHHHHH")
    ob = Notification.objects.all()
    data = []
    print(ob,"HHHHHHHHHHHHHHHH")
    for i in ob:
        notification = {"Notification":i.Notification, "Date":str(i.Date), "status":i.status}
        data.append(notification)
        print(data,"NNNNNNNNNNNNNNN")
    l = json.dumps(data)
    return HttpResponse(l)


def view_reply(request):
    aid = request.POST['lid']
    print(aid,"HHHHHHHHHHHHHHHHHHHHHHH")
    ob = Complaint.objects.filter(USER__LOGIN__id=aid)
    data = []
    print(ob,"HHHHHHHHHHHHHHHH")
    for i in ob:
        reply = {"Reply":i.Reply, "Date":str(i.Date),'complaint':i.Complaint}
        data.append(reply)
        print(data,"NNNNNNNNNNNNNNN")
    l = json.dumps(data)
    return HttpResponse(l)

def snd_complaints(request):
    complaint = request.POST['complaint']
    a_id = request.POST['a_id']
    user = request.POST['lid']
    ob = Complaint()
    ob.Complaint = complaint
    ob.Date =datetime.now()
    ob.Reply = 'Pending'
    ob.AUTHORITY = Authority.objects.get(id=a_id)
    ob.USER = User.objects.get(LOGIN__id=user)
    ob.save()
    data = {"task": "valid"}
    l = json.dumps(data)
    print(l)
    return HttpResponse(l)

def snd_feedback(request):
    feedback = request.POST['feedback']
    idd = request.POST['lid']
    print("5555555555555555555555555555555", idd)
    ob = Feedback()
    ob.Feedback = feedback
    ob.Date =datetime.now()
    print(idd,"%%%%%%%%%%%")
    ob.USER = User.objects.get(LOGIN__id=idd)
    ob.save()
    data = {"task": "valid"}
    l = json.dumps(data)
    print(l)
    return HttpResponse(l)

def reprt_emergency(request):
    des=request.POST['des']
    # latitude=request.POST['latitude']
    # longitude=request.POST['longitude']
    user = request.POST['lid']
    image=request.FILES['image']
    fs=FileSystemStorage()
    fn=fs.save(image.name,image)
    ob = Report_emergency()
    ob.Image = fn
    ob.Description=des
    ob.Date =datetime.today()
    ob.Latitude=11.22
    ob.Longitude=11.22
    ob.Status='pending'
    ob.USER = User.objects.get(LOGIN__id=user)
    ob.save()
    data = {"task": "valid"}
    l = json.dumps(data)
    print(l)
    return HttpResponse(l)




def request_extrausage(request):
    user = request.POST['lid']
    f_date=request.POST['f_date']
    t_date=request.POST['t_date']
    Reason=request.POST['reason']
    amount = request.POST['amount']
    ob = Extra_usage()
    ob.F_Date=f_date
    ob.T_Date =t_date
    ob.Reason=Reason
    ob.Amount=amount
    ob.Status="pending"
    ob.USER = User.objects.get(LOGIN__id=user)
    ob.save()
    data = {"task": "valid"}
    l = json.dumps(data)
    print(l)
    return HttpResponse(l)




def view_request_status(request):
    uid = request.POST['lid']
    print(uid,"HHHHHHHHHHHHHHHHHHHHHHH")
    ob = Extra_usage.objects.filter(USER__LOGIN__id=uid)
    data = []
    print(ob,"HHHHHHHHHHHHHHHH")
    for i in ob:
        request_status = {"fdate":str(i.F_Date), "tdate":str(i.T_Date),"reason":i.Reason,"amount":i.Amount,"status":i.Status, "id": i.id}
        data.append(request_status)
        print(data,"NNNNNNNNNNNNNNN")
    l = json.dumps(data)
    return HttpResponse(l)

def search_view_request_status(request):
    uid = request.POST['lid']
    date=request.POST['date']
    print(uid,"HHHHHHHHHHHHHHHHHHHHHHH")
    ob = Extra_usage.objects.filter(USER__LOGIN__id=uid,F_Date=date)
    data = []
    print(ob,"HHHHHHHHHHHHHHHH")
    for i in ob:
        request_status = {"fdate": str(i.F_Date), "tdate": str(i.T_Date), "reason": i.Reason, "amount": i.Amount,
                          "status": i.Status, "id": i.id}
        data.append(request_status)
        print(data, "NNNNNNNNNNNNNNN")
    l = json.dumps(data)
    return HttpResponse(l)

def view_authority(request):
    print("**************************", request.POST)
    ob = Authority.objects.all()
    data = []
    print(ob,"HHHHHHHHHHHHHHHH")
    for i in ob:
        request_status = {" Name": i.Name, "aid":i.id}
        data.append(request_status)
        print(data,"NNNNNNNNNNNNNNN")
    l = json.dumps(data)
    return HttpResponse(l)


def delete_requeststatus(request):
    req_id = request.POST['id']
    ob = Extra_usage.objects.get(id=req_id)
    ob.delete()
    data = {"task": "valid"}
    l = json.dumps(data)
    print(l)
    return HttpResponse(l)

def main(path):
    # Get File Name from Command Line
    # path = input("Enter the file path : ").strip()
    # Load the required image
    print("path===",path)
    image = cv2.imread(path)
    # print(image)
    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
    # Store grayscale image as a temporary file to apply OCR
    filename = "{}.png".format("temp")
    cv2.imwrite(filename, gray)
    print("--------------cv writee")
    # Load the image as a PIL/Pillow image, apply OCR, and then delete the temporary file
    # pytesseract.pytesseract.tesseract_cmd = r'"C:\Program Files\Tesseract-OCR\tesseract.exe'
    pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'
    # pytesseract.pytesseract.tesseract_cmd = r'"C:\Tesseract-OCR\tesseract.exe'
    text = pytesseract.image_to_string(Image.open(filename))
    print("OCR Text is " + text.strip())
    # val=text.strip().split('D')
    # atte=val[0].split(',')
    # print(atte[0],atte[1])
    # # print(val[1])
    if text.strip()!="":
        return  text.strip()
    else:
        return "5"


def calc_bill(request):
    image = request.FILES['file']
    usr = request.POST['lid']
    fs = FileSystemStorage()
    fsave = fs.save(image.name, image)
    print(fsave,"fffffffffffff")
    reading = main(r"C:\Users\kadhe\OneDrive\Desktop\smart_meter\media/"+fsave)
    print(reading,")))))))))")
    ob=Bill.objects.filter(USER__LOGIN__id=usr)
    ir=0
    for i in ob:
        if len(ob)>0:
            ir=float(i.Reading)
    uu=float(reading)-float(-ir)
    if uu<50:
        amt=uu*3.30
    elif uu<100:
        amt=uu*3.60
    elif uu<150:
        amt=uu*4.03
    elif uu<200:
        amt=uu*4.61
    elif uu < 250:
        amt = uu*6.50
    elif uu<300:
        amt=uu*6.50
    elif uu<350:
        amt=uu*7.60
    elif uu<400:
        amt=uu*7.60
    elif uu<500:
        amt=uu*7.60
    else:
        amt=uu *8.70
    print(request.POST,"oooooooooooooooooooooooo")
    ob=Bill()
    ob.Amount=amt
    ob.Unit_used=uu
    ob.Reading=reading
    ob.Status='pending'
    # ob.aid=authority_table.objects.get(id=1)
    ob.USER = User.objects.get(LOGIN__id=usr)
    ob.Last_date=datetime.today()
    ob.save()
    first_name=ob.USER.Name+" "+ob.USER.Lname
    data = {"task": "valid",'usr':first_name, 'unit':uu, 'rdng':reading, 'amt':amt,'id':ob.id}
    l = json.dumps(data)
    print(l)
    return HttpResponse(l)

def payment(request):
    import datetime
    now = datetime.datetime.now()
    billid=request.POST["bid"]
    userlid=request.POST["lid"]
    amount=request.POST["amnt"]
    ob=Bill.objects.get(id=billid)
    lastdate=ob.Last_date
    date_str2 = now.strftime("%Y-%m-%d")
    from datetime import datetime
    # Define two dates
    date_str1 =str(lastdate)
    # date_str2 = datetime.now()
    # Convert date strings to datetime objects
    date_format = "%Y-%m-%d"
    date1 = datetime.strptime(date_str1, date_format)
    date2 = datetime.strptime(date_str2, date_format)
    # Calculate the difference between the dates
    date_difference = date2 - date1
    # Extract the number of days
    days_difference = date_difference.days
    fine=int(days_difference)*20
    obb=Bill.objects.get(id=billid)
    obb.Status="Paid"
    obb.save()
    ob2=Payment()
    ob2.USER=User.objects.get(LOGIN=userlid)
    ob2.BILL=Bill.objects.get(id=billid)
    ob2.Amount=amount
    ob2.Status="Paid"
    ob2.Date=datetime.today()
    ob2.Fine=str(fine)
    ob2.save()
    data={"task":"valid"}
    r=json.dumps(data)
    return HttpResponse(r)


# print(main("qwer.png"))