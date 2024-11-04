"""smart_meter URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include

from smartapp import views

urlpatterns = [
    path('',views.log,name="main"),
    path('addauthority',views.addauthority,name="addauthority"),
    path('addbill', views.addbill, name="addbill"),
    path('addedbill', views.addedbill, name="addedbill"),

    path('adminhome', views.adminhome, name="adminhome"),
    path('authorityhome', views.authorityhome, name="authorityhome"),
    path('deleteauthority/<int:id>', views.deleteauthority, name="deleteauthority"),
    path('editauthority/<int:id>', views.editauthority, name="editauthority"),
    path('updateauthority', views.updateauthority, name="updateauthority"),
    path('manageauthority', views.manageauthority, name="manageauthority"),
    path('managebill', views.managebill, name="managebill"),
    path('deletebill/<int:id>', views.deletebill, name="deletebill"),
    path('editbill/<int:id>', views.editbill, name="editbill"),
    path('updatebill', views.updatebill, name="updatebill"),
    path('notification', views.notification, name="notification"),
    path('searchnotification', views.searchnotification, name="searchnotification"),
    path('paymenthistory', views.paymenthistory, name="paymenthistory"),
    path('sendreply', views.sendreply, name="sendreply"),
    path('verifyusers', views.verifyusers, name="verifyusers"),
    path('searchuser', views.searchuser, name="searchuser"),
    path('viewbilldetails', views.viewbilldetails, name="viewbilldetails"),
    path('searchbill', views.searchbill, name="searchbill"),
    path('viewbills', views.viewbills, name="viewbills"),
    path('viewcomplaintandreply', views.viewcomplaintandreply, name="viewcomplaintandreply"),
    path('searchcomplaint', views.searchcomplaint, name="searchcomplaint"),
    path('viewcomplaint', views.viewcomplaint, name="viewcomplaint"),
    path('searchviewcomplaint', views.searchviewcomplaint, name="searchviewcomplaint"),
    path('viewfeedback', views.viewfeedback, name="viewfeedback"),
    path('searchfeedback', views.searchfeedback, name="searchfeedback"),
    path('viewprofile', views.viewprofile, name="viewprofile"),
    path('viewuser', views.viewuser, name="viewuser"),
    path('adextrausage', views.adextrausage, name="adextrausage"),
    path('adviewemergency', views.adviewemergency, name="adviewemergency"),
    path('extrausage', views.extrausage, name="extrausage"),
    path('sendupdation', views.sendupdation, name="sendupdation"),
    path('viewemergency', views.viewemergency, name="viewemergency"),
    path('adviewfeedback', views.adviewfeedback, name="adviewfeedback"),
    path('searchdate', views.searchdate, name="searchdate"),
    path('searchmanagebill', views.searchmanagebill, name="searchmanagebill"),
    path('register', views.register, name="register"),
    path('loginn', views.loginn, name="loginn"),
    path('logout', views.logout, name="logout"),
    path('calc_bill', views.calc_bill, name="calc_bill"),
    path('payment', views.payment, name="payment"),

    path('addedauthority', views.addedauthority, name="addedauthority"),
    path('addnotification', views.addnotification, name="addnotification"),
    path('insertnotification', views.insertnotification, name="insertnotification"),
    path('deletenotification/<int:id>', views.deletenotification, name="deletenotification"),
    path('insertreply', views.insertreply, name="insertreply"),
    path('searchauthority', views.searchauthority, name="searchauthority"),
    path('adminnotification', views.adminnotification, name="adminnotification"),
    path('acceptnotification/<int:id>', views.acceptnotification, name="acceptnotification"),
    path('declinenotification/<int:id>', views.declinenotification, name="declinenotification"),
    path('and_logincode', views.and_logincode, name="and_logincode"),
    path('view_profile', views. view_profile, name=" view_profile"),
    path('Register', views.Register, name=" Register"),
    path('view_bill', views.view_bill, name=" view_bill"),
    path('view_notification', views.view_notification, name="view_notification"),
    path('view_reply', views.view_reply, name="view_reply"),
    path('snd_complaints', views.snd_complaints, name="snd_complaints"),
    path('snd_feedback', views.snd_feedback, name="snd_feedback"),
    path('reprt_emergency', views.reprt_emergency, name="reprt_emergency"),
    path('request_extrausage', views.request_extrausage, name="request_extrausage"),
    path('view_request_status', views.view_request_status, name="view_request_status"),
    path('search_view_request_status', views.search_view_request_status, name="search_view_request_status"),
    path('view_authority', views.view_authority, name="view_authority"),
    path('delete_requeststatus', views.delete_requeststatus, name="delete_requeststatus"),

]
