from django import forms

class loginForm(forms.Form):
	username = forms.CharField(max_length=50)
	password = forms.CharField(widget=forms.PasswordInput(render_value=False), label="Password")

class signupForm(forms.Form):
	username = forms.CharField(max_length=50)
	password = forms.CharField(widget=forms.PasswordInput(render_value=False), label="Password")
	email = forms.EmailField()
	first_name = forms.CharField(max_length=50, required=False)
	last_name = forms.CharField(max_length=50, required=False)

