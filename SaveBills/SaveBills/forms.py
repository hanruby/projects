from django.forms import ModelForm
from models import *

class BillForm(ModelForm):
    class Meta:
        model = Bill