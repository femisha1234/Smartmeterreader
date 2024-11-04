from django.db import models

# Create your models here.

class Login(models.Model):
    Username = models.CharField(max_length=50)
    Password = models.CharField(max_length=50)
    Type = models.CharField(max_length=50)

class Authority(models.Model):
    LOGIN=models.ForeignKey(Login, on_delete=models.CASCADE)
    Name = models.CharField(max_length=50)
    Designation=models.CharField(max_length=100)
    Phone = models.BigIntegerField()
    Place = models.CharField(max_length=50)
    Email = models.CharField(max_length=50)
    Image=models.FileField()

class User(models.Model):
    LOGIN = models.ForeignKey(Login, on_delete=models.CASCADE)
    Name = models.CharField(max_length=50)
    Lname = models.CharField(max_length=50)
    Phone = models.BigIntegerField()
    Place = models.CharField(max_length=50)
    Email = models.CharField(max_length=50)
    Post = models.CharField(max_length=50)
    Pin = models.BigIntegerField()
    Consumer_no=models.CharField(max_length=50)

class  Complaint(models.Model):
    AUTHORITY=models.ForeignKey(Authority, on_delete=models.CASCADE)
    USER=models.ForeignKey(User, on_delete=models.CASCADE)
    Complaint=models.CharField(max_length=100)
    Date=models.DateField()
    Reply=models.CharField(max_length=100)


class  Feedback(models.Model):
       USER = models.ForeignKey(User, on_delete=models.CASCADE)
       Feedback=models.CharField(max_length=100)
       Date=models.DateField()

class  Bill(models.Model):
    USER = models.ForeignKey(User, on_delete=models.CASCADE)
    Unit_used = models.CharField(max_length=50)
    Reading = models.CharField(max_length=50)
    Status = models.CharField(max_length=50)
    Last_date = models.DateField()
    Amount = models.CharField(max_length=50)

class  Payment(models.Model):
    USER = models.ForeignKey(User, on_delete=models.CASCADE)
    BILL = models.ForeignKey(Bill, on_delete=models.CASCADE)
    Amount = models.CharField(max_length=50)
    Status = models.CharField(max_length=50)
    Date = models.DateField()
    Fine = models.CharField(max_length=50)

class  Notification(models.Model):
    AUTHORITY = models.ForeignKey(Authority, on_delete=models.CASCADE)
    Notification = models.CharField(max_length=100)
    Date = models.DateField()
    status=models.CharField(max_length=100)


class Report_emergency(models.Model):
    USER = models.ForeignKey(User, on_delete=models.CASCADE)
    Image = models.FileField()
    Description = models.CharField(max_length=100)
    Date = models.DateField()
    Latitude = models.CharField(max_length=50)
    Longitude = models.CharField(max_length=50)
    Status = models.CharField(max_length=50)


class Extra_usage(models.Model):
    USER = models.ForeignKey(User, on_delete=models.CASCADE)
    F_Date = models.DateField()
    T_Date = models.DateField()
    Reason = models.CharField(max_length=100)
    Amount = models.CharField(max_length=50)
    Status = models.CharField(max_length=50)

class Register(models.Model):
    Name=models.CharField(max_length=50)
    Phone = models.BigIntegerField()
    Place = models.CharField(max_length=50)
    Post = models.CharField(max_length=50)
    Pin = models.BigIntegerField()
    Consumer_no = models.CharField(max_length=50)
    Email = models.CharField(max_length=50)
    LOGIN=models.ForeignKey(Login,on_delete=models.CASCADE)





















































