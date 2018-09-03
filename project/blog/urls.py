from django.urls import path
from .views import (
    PostListView,
    PostDetailView,
    PostCreateView,
)
from . import views

urlpatterns = [

    path('', PostListView.as_view(), name='blog-home'),
    path('<int:pk>/', PostDetailView.as_view(), name='post-detail'),
    path('create/', PostCreateView.as_view(), name='post-create'),
    path('about/', views.about, name='blog-about'),

]
