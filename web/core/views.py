import requests
from django.shortcuts import render, redirect
from django.http import HttpResponseRedirect
from django.urls import reverse

API_URL = 'http://api:3000/api'

def home(request):
    try:
        response = requests.get(f'{API_URL}/catalogo', timeout=5)
        data = response.json()
    except Exception as e:
        data = []
        print("Error al llamar a la API:", e)
    
    token = request.session.get('token')
    nombre = request.session.get('nombre')
    return render(request, 'index.html', {'data': data, 'token': token, 'nombre': nombre})

def login_view(request):
    if request.method == 'POST':
        email = request.POST.get('email')
        password = request.POST.get('password')
        try:
            response = requests.post(f'{API_URL}/login', json={'email': email, 'password': password}, timeout=5)
            if response.status_code == 200:
                data = response.json()
                request.session['token'] = data['token']
                request.session['nombre'] = data['nombre']
                request.session['id'] = data['id']
                return redirect('dashboard')
            else:
                return render(request, 'login.html', {'error': 'Credenciales inválidas'})
        except Exception as e:
            return render(request, 'login.html', {'error': 'Error al conectar con la API'})
    return render(request, 'login.html')

def dashboard_view(request):
    token = request.session.get('token')
    if not token:
        return redirect('login')
    
    nombre = request.session.get('nombre')
    mensaje_dni = None

    # Si se ha subido un DNI (POST desde el propio dashboard)
    if request.method == 'POST' and request.FILES.get('archivo'):
        archivo = request.FILES['archivo']
        files = {'archivo': (archivo.name, archivo.read(), archivo.content_type)}
        headers = {'Authorization': f'Bearer {token}'}
        try:
            response = requests.post(f'{API_URL}/store/createdoc', files=files, headers=headers, timeout=10)
            if response.status_code == 200:
                mensaje_dni = 'DNI subido correctamente'
            else:
                mensaje_dni = 'Error al subir el DNI'
        except Exception as e:
            mensaje_dni = 'Error de conexión'

    # Obtener historial de facturas
    historial = []
    try:
        headers = {'Authorization': f'Bearer {token}'}
        response = requests.post(f'{API_URL}/store/getdocuments', json={}, headers=headers, timeout=5)
        if response.status_code == 200:
            historial = response.json().get('historial', [])
    except Exception as e:
        historial = []

    # Obtener morosidad
    morosidad = None
    try:
        headers = {'Authorization': f'Bearer {token}'}
        response = requests.post(f'{API_URL}/student/morosidad', json={}, headers=headers, timeout=5)
        if response.status_code == 200:
            morosidad = response.json()
    except Exception as e:
        morosidad = None

    return render(request, 'dashboard.html', {
        'token': token,
        'nombre': nombre,
        'mensaje_dni': mensaje_dni,
        'historial': historial,
        'morosidad': morosidad,
    })

# Las vistas individuales de historial y morosidad ya no son necesarias para el dashboard,
# pero las dejamos por si quieres mantenerlas como páginas independientes.
# Puedes eliminarlas si no las usas.

def historial_view(request):
    # Redirige al dashboard si se accede directamente
    return redirect('dashboard')

def morosidad_view(request):
    return redirect('dashboard')

def logout_view(request):
    request.session.flush()
    return redirect('home')