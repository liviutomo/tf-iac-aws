import string
from django.shortcuts import render
from django.http import HttpResponse
import random
# Create your views here.

def home(request):
    lenght_options = range(6, 30) # Define the range of lenghts - for ex 6 - 30
    return render(
        request=request,
        template_name='generator/home.html',
        context={'length_options': lenght_options}
    )

def evaluate_password_strength(password):
    length = len(password)
    has_upper_letters = any(char.isupper() for char in password)
    has_numbers = any(char.isdigit() for char in password)
    has_special = any(not char.isalnum() for char in password)

    if length > 14 and has_upper_letters and has_numbers and has_special:
        return 'strong'
    elif length > 8 and length < 14 and has_upper_letters and has_numbers and not has_special:
        return 'medium'
    elif length < 8:
        return 'weak'
    else:
        return 'weak'  # Default case

def health_check(request):
    # Perform any necessary health checks
    # For example, check database connectivity or other dependencies
    # If all checks pass, return a 200 OK response
    return HttpResponse("OK")
    

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

    strength = evaluate_password_strength(the_password)

    return render(
            request=request,
            template_name='generator/password.html',
            context={'password': the_password,
                     'strength': strength},
    )