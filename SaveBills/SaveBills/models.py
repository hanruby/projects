from django.db import models

class Bill(models.Model):
    bill_number    = models.CharField(max_length = 50)
    bill_name      = models.CharField(max_length = 50)
    bill_image     = models.ImageField(upload_to="bill-images/")