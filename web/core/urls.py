from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('login/', views.login_view, name='login'),
    path('dashboard/', views.dashboard_view, name='dashboard'),
    path('historial/', views.historial_view, name='historial'),
    path('morosidad/', views.morosidad_view, name='morosidad'),
    path('logout/', views.logout_view, name='logout'),
]