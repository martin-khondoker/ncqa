from django.http import HttpResponse, HttpResponseRedirect
from django.template import Context, loader, RequestContext
from django.shortcuts import render_to_response, render
from django.utils import simplejson
from bugs.models import Issue, Sprint
from ncqa.forms import loginForm, signupForm
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User

def home(request):
	Sprints = Sprint.objects.all().order_by('-release_date')
	return render_to_response('base.html',{'sprints': Sprints}, context_instance=RequestContext(request))

def ajax(request):
	if request.is_ajax():
		#import pdb; pdb.set_trace()
		bugs = Issue.objects.all()
		#design_bugs = Issue.objects.filter(bugyman__team__name__exact='design')
		return_dict = {'design': 21,'api': 24, 'cms': 12, 'cp': 16}
		json = simplejson.dumps(return_dict)
		return HttpResponse(json, mimetype="application/x-javascript")
	else:
		return HttpResponse('This is not ajax request')

def test(request):
	bugs = Issue.objects.filter(bug__bug_type__exact='design')
	bcount = bugs.count()
	return render_to_response('test.html',{'dbugs': bugs, 'n': bcount})

def userLogin(request):
	if request.user.is_authenticated():
		return HttpResponseRedirect('/')
	else:
		if request.method == 'POST':
			form = loginForm(request.POST)
			if form.is_valid():
				username = request.POST['username']
				password = request.POST['password']				
				user = authenticate(username=username, password=password)
				if user is not None:
					if user.is_active:
						login(request, user)
						return HttpResponseRedirect('/')
				else:
					msg = 'User name & password does not match'
					return render(request, 'login.html', {'form': form, 'msg': msg})
			else:
				return render_to_response('login.html',{'form': form}, context_instance=RequestContext(request))
		else:
			form = loginForm()
		return render(request, 'login.html', {'form': form})

def signup(request):
	signup = signupForm()
	if request.method == 'POST':
		signup = signupForm(request.POST)
		if signup.is_valid():
			name = signup.cleaned_data['username']
			password = signup.cleaned_data['password']
			email = signup.cleaned_data['email']
			first_name = signup.cleaned_data['first_name']
			last_name = signup.cleaned_data['last_name']

			newuser = User.objects.create_user(name, email, password)

			if newuser is not None:
				newuser.first_name = first_name
				newuser.last_name = last_name
				newuser.save()
				return HttpResponseRedirect('/login/')
			else:

				return HttpResponse('user not added')
		else:
			return render_to_response('signup.html',{'msg': msg, 'form': signupForm}, context_instance=RequestContext(request))
	else:
		
		return render_to_response('signup.html',{'form': signup}, context_instance=RequestContext(request))	

def userLogout(request):
	logout(request)
	return HttpResponseRedirect('/')