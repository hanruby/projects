from django.conf.urls import patterns, include, url
from django.contrib import admin

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'SaveBills.views.home', name='home'),
    # url(r'^SaveBills/', include('SaveBills.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)

from django.conf.urls.defaults import *
from SaveBills.views import *


urlpatterns = patterns('',
    ('^home/$', show_home),
    ('^showAddBill/$', show_add_bill),
    ('^savebill/$', save_bill),
    ('^getbill/$', get_bill),
    ('^deletebill/$', delete_bill),
    ('^hello/$', hello),
    ('^date/$', current_datetime),
    # (r'^time/plus/(\d{1,2})/$', hours_ahead),
    
    # url(r'^admin/', include(admin.site.urls)),
)
