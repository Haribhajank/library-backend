from django.db import models

# Create your models here.  

class Book(models.Model):
    title = models.CharField(max_length=255)
    author_name = models.CharField(max_length=255, db_index=True) # Indexed for speed!
    isbn = models.CharField(max_length=13, unique=True)

    def __str__(self):
        return self.title
