import string
from django.shortcuts import render
from django.http import HttpResponse
import random
# Create your views here.

def home(request):
    lenght_options = range(12, 25) # Define the range of lenghts - for ex 6 - 24
    return render(
        request=request,
        template_name='generator/home.html',
        context={'length_options': lenght_options}
    )

def password(request):
    chars = string.ascii_lowercase

    if 'uppercase' in request.GET:
        chars += string.ascii_uppercase
    if 'special' in request.GET:
        chars += string.punctuation
    if 'numbers' in request.GET:
        chars += string.digits

    length = int(request.GET.get('length', 14))

    password = [random.choice(chars) for _ in range(length)]
    random.shuffle(password)
    the_password = ''.join(password)

    return render(
            request=request,
            template_name='generator/password.html',
            context={'password': the_password}
    )