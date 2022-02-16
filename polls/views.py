from django.http import HttpResponse
from django.shortcuts import render


def poll_list(request):
    return render(request, 'polls/base.html', {})
    # return HttpResponse("Hello, world. You're at the polls index.")

def post_list(request):
    return render(request, 'polls/base.html')