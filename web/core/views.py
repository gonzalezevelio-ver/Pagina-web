import requests
from django.shortcuts import render

def home(request):
    try:
        response = requests.get('http://api:3000/api/catalogo', timeout=5)
        data = response.json()
    except Exception as e:
        data = []
        print("Error al llamar a la API:", e)
    return render(request, 'index.html', {'data': data})

def usuarios(request):
    try:
        response = requests.get('http://api:3000/api/usuarios', timeout=5)
        usuarios = response.json()
    except Exception as e:
        usuarios = []
        print("Error al llamar a la API:", e)
    return render(request, 'usuarios.html', {'usuarios': usuarios})