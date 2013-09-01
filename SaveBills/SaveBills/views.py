from django.http import Http404, HttpResponse
from django.views.generic.simple import direct_to_template

from django.core import serializers

from models import *
from forms import *

import datetime

def hello(request):
    return HttpResponse("Hello world")

def current_datetime(request):
    now = datetime.datetime.now()
    html = "<html><body>It is now %s.</body></html>" % now
    return HttpResponse(html)

def show_home(request):
    return direct_to_template(request, "Home.html")

def show_add_bill(request):
    return direct_to_template(request, "AddBill.html")

def save_bill(request):
    print 'save-bill'
    bill = BillForm(request.POST, request.FILES)
    print bill.is_valid()
    if bill.is_valid():
        bill.save()
    else:
        print bill.errors
        HttpResponse("error")
    return show_home(request)

def delete_bill(request):
    bill_id = request.GET['bill_id']
    Bill.objects.filter(id='%s' % bill_id).delete()
    return HttpResponse("Sucess")

def get_bill(request):
    bill_id = request.GET['bill_id']
    bill = Bill.objects.filter(id='%s' % bill_id)
    return HttpResponse(serializers.serialize("json", bill))
    
def hours_ahead(request, offset):
    try:
        offset = int(offset)
    except ValueError:
        raise Http404()
    dt = datetime.datetime.now() + datetime.timedelta(hours=offset)
    html = "<html><body>In %s hour(s), it will be %s.</body></html>" % (offset, dt)
    return HttpResponse(html)
