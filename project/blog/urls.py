from django.urls import path
from .views import (
    PostCreateView,
    PostListView,
    UserPostListView,
    PostDetailView,
    PostUpdateView,
    PostDeleteView,
)
from . import views

urlpatterns = [

    path('', PostListView.as_view(), name='blog-home'),
    path('users/<str:username>/', UserPostListView.as_view(), name='user-posts'),
    path('<int:pk>/', PostDetailView.as_view(), name='post-detail'),
    path('create/', PostCreateView.as_view(), name='post-create'),
    path('<int:pk>/update/', PostUpdateView.as_view(), name='post-update'),
    path('<int:pk>/delete/', PostDeleteView.as_view(), name='post-delete'),
    path('about-me/', views.about_me, name='about-me'),

]
