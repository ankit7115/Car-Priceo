# urls.py
from django.urls import path
from predictions import views

urlpatterns = [
    path('receive_data/', views.receive_data),
]
