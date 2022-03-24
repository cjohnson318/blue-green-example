import os

from django.shortcuts import render

def home(request):
    context = {'color': os.getenv('COLOR')}
    return render(request, 'home.html', context=context)
