from django.shortcuts import render

# Create your views here.

from rest_framework import viewsets
from .models import Book
from .serializers import BookSerializer

class BookViewSet(viewsets.ModelViewSet):
    # This automatically gives you LIST, CREATE, RETRIEVE, UPDATE, DESTROY
    queryset = Book.objects.all()
    serializer_class = BookSerializer