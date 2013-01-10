from django.forms import ModelForm
from bugs.models import *

class bugForm(ModelForm):
	class Meta:
		model = Bug

class teamForm(ModelForm):
	class Meta:
		model = Team

class memberForm(ModelForm):
	class Meta:
		model = Member

class sprintjobForm(ModelForm):
	class Meta:
		model = SprintJob

class sprintForm(ModelForm):
	class Meta:
		model = Sprint

class issueForm(ModelForm):
	class Meta:
		model = Issue
		