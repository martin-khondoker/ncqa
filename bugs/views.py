# Create your views here.
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect
from django.template import RequestContext
from django.shortcuts import render_to_response
from bugs.forms import bugForm, teamForm, memberForm, sprintjobForm, sprintForm, issueForm
from bugs.models import Bug, Team, Member, SprintJob, Sprint, Issue
from django.utils import simplejson, formats
import json


def bugs(request):
	bugs = []	
	sprints = Sprint.objects.all()
	for sp in sprints:
		sprint = {}
		spbugs = Issue.objects.filter(sprint__pk=sp.id).count()
		clientbugs = Issue.objects.filter(sprintjob__job_type='bugfix')
		sprint = { 'title': sp.release_date, 'totalbugs': spbugs, 'clientissue': clientbugs}
		bugs.append(sprint)
	#import pdb; pdb.set_trace()
	return render_to_response('bugs/bugs.html',{'bugs':bugs}, context_instance=RequestContext(request))

@login_required(login_url='/login/')
def addbug(request):
	msg = "This is a message for add bug views"
	if request.method == 'POST':
		bugform = bugForm(request.POST, request.FILES)
		if bugform.is_valid():
			bugform.save()
			return HttpResponseRedirect('/listbugs/')
		else:
			return render_to_response('bugs/addbug.html',{'form': bugform}, 
		context_instance=RequestContext(request))
	else:
		title = 'This is add bug form'
		bugform = bugForm()
	return render_to_response('bugs/addbug.html',{'form': bugform}, 
		context_instance=RequestContext(request))

def listbugs(request):
	bugs = Bug.objects.all()
	return render_to_response('bugs/listbugs.html', {'bugs': bugs}, context_instance=RequestContext(request))

def bugdetails(request, bug_id):
	bug = Bug.objects.filter(pk__exact=bug_id)
	return render_to_response('bugs/bugdetails.html',{'bug': bug}, context_instance=RequestContext(request))

@login_required(login_url='/login/')
def addteam(request):
	msg = "This is a message for add bug views"
	if request.method == 'POST':
		teamform = teamForm(request.POST, request.FILES)
		if teamform.is_valid():
			teamform.save()
			return HttpResponseRedirect('/listteams/')
	else:
		title = 'This is add bug form'
		teamform = teamForm()
	return render_to_response('bugs/addteam.html',{'form': teamform}, 
		context_instance=RequestContext(request))

def listteams(request):
	teams = Team.objects.all()
	return render_to_response('bugs/listteams.html', {'teams': teams}, context_instance=RequestContext(request))

@login_required(login_url='/login/')
def addmember(request):
	msg = "This is a message for add member views"
	if request.method == 'POST':
		memberform = memberForm(request.POST, request.FILES)
		if memberform.is_valid():
			memberform.save()
			return HttpResponseRedirect('/listmembers/')
	else:
		title = 'This is add member form'
		memberform = memberForm()
	return render_to_response('bugs/addmember.html',{'form': memberform}, 
		context_instance=RequestContext(request))

def listmembers(request):
	members = Member.objects.all()
	return render_to_response('bugs/listmembers.html', {'members': members}, context_instance=RequestContext(request))

@login_required(login_url='/login/')
def addsprintjob(request):
	msg = "This is a message for add sprintjob views"
	if request.method == 'POST':
		sprintjobform = sprintjobForm(request.POST, request.FILES)
		if sprintjobform.is_valid():
			sprintjobform.save()
			return HttpResponseRedirect('/listsprintjobs/')
	else:
		title = 'This is add sprintjob form'
		sprintjobform = sprintjobForm()
	return render_to_response('bugs/addsprintjob.html',{'form': sprintjobform}, 
		context_instance=RequestContext(request))

def listsprintjobs(request):
	sprintjobs = SprintJob.objects.all()
	#import pdb; pdb.set_trace()
	return render_to_response('bugs/listsprintjobs.html', {'sprintjobs': sprintjobs}, context_instance=RequestContext(request))

@login_required(login_url='/login/')
def addsprint(request):
	msg = "This is a message for add sprint views"
	if request.method == 'POST':
		sprintform = sprintForm(request.POST, request.FILES)
		if sprintform.is_valid():
			sprintform.save()
			return HttpResponseRedirect('/listsprints/')
	else:
		title = 'This is add sprint form'
		sprintform = sprintForm()
	return render_to_response('bugs/addsprint.html',{'form': sprintform}, 
		context_instance=RequestContext(request))

def listsprints(request):
	sprints = Sprint.objects.all()
	return render_to_response('bugs/listsprints.html', {'sprints': sprints}, context_instance=RequestContext(request))

@login_required(login_url='/login/')
def addissue(request):
	msg = "This is a message for add issue views"
	if request.method == 'POST':
		issueform = issueForm(request.POST, request.FILES)
		if issueform.is_valid():
			#import pdb; pdb.set_trace()
			issueform.save()
			return HttpResponseRedirect('/listissues/')
	else:
		title = 'This is add issue form'
		issueform = issueForm()
	return render_to_response('bugs/addissue.html',{'form': issueform}, 
		context_instance=RequestContext(request))

def listissues(request):
	issues = Issue.objects.all()
	
	return render_to_response('bugs/listissues.html', {'issues': issues}, context_instance=RequestContext(request))

def issuedetails(request, issue_id):
	issue = Issue.objects.filter(pk__exact=issue_id)
	return render_to_response('bugs/issuedetails.html',{'issue': issue}, context_instance=RequestContext(request))

def report(request):
	return render_to_response('bugs/report.html', {})

def listbugsperteam(request):	
	
	if request.is_ajax():
		sprint = int(request.GET['sprint'])
		design_bugs = Issue.objects.filter(bugyman__team__team_name__exact='design', sprint__id__exact=sprint).count()
		cms_bugs = Issue.objects.filter(bugyman__team__team_name__exact='dev-cms', sprint__id__exact=sprint).count()
		api_bugs = Issue.objects.filter(bugyman__team__team_name__exact='platform', sprint__id__exact=sprint).count()
		cp_bugs = Issue.objects.filter(bugyman__team__team_name__exact='dev-cp', sprint__id__exact=sprint).count()


		return_dict = {'design': design_bugs,'api': api_bugs, 'cms': cms_bugs, 'cp': cp_bugs }
		json = simplejson.dumps(return_dict)
	#return HttpResponse('Design %s, CMS %s , api %s & cp %s' % (design_bugs, cms_bugs, api_bugs, cp_bugs))
		return HttpResponse(json, mimetype="application/x-javascript")
	else:
		return False

def bugsperjob(request):
	return_dict = {}	
	if request.is_ajax():
		sprint = int(request.GET['sprint'])	
		jobs = SprintJob.objects.filter(sprint__pk=sprint)
		for job in jobs:
			bugs = Issue.objects.filter(sprintjob__id__exact=job.id).count()
			return_dict[job.title] = bugs

		json = simplejson.dumps(return_dict)	
		return HttpResponse(json, mimetype="application/x-javascript")
	else:
		return False

def bugspermember(request):
	#import pdb; pdb.set_trace();
	if request.is_ajax():
		sprint = int(request.GET['sprint'])
		return_dict = {}
		Members = []
		jobs = SprintJob.objects.filter(sprint__id__exact=sprint)

		for job in jobs:
			devs = job.developers.all()
			for dev in devs:
				if not dev.name in Members:
					Members.append(dev.name)
		for member in Members:
			bugs = Issue.objects.filter(bugyman__name__exact=member, sprint__pk__exact=sprint).count()
			return_dict[member] = bugs

		json = simplejson.dumps(return_dict)	
		return HttpResponse(json, mimetype="application/x-javascript")
	else:
		return False
	#return HttpResponse('This is Members %s' % return_dict)

def bugsperteam(request):
	if request.is_ajax():		
		return_dict = {}
		design_bugs = Issue.objects.filter(bugyman__team__team_name__exact='design').count()
		cms_bugs = Issue.objects.filter(bugyman__team__team_name__exact='dev-cms').count()
		api_bugs = Issue.objects.filter(bugyman__team__team_name__exact='platform').count()
		cp_bugs = Issue.objects.filter(bugyman__team__team_name__exact='dev-cp').count()


		return_dict = {'design': design_bugs,'api': api_bugs, 'cms': cms_bugs, 'cp': cp_bugs }
		json = simplejson.dumps(return_dict)
	#return HttpResponse('Design %s, CMS %s , api %s & cp %s' % (design_bugs, cms_bugs, api_bugs, cp_bugs))
		return HttpResponse(json, mimetype="application/x-javascript")
	else:
	 	return HttpResponse('Ajax was not called!')

def avgbugsperteam(request):
	if request.is_ajax():
		return_dict = {}
		design_bugs = Issue.objects.filter(bugyman__team__team_name__exact='design').count()
		cms_bugs = Issue.objects.filter(bugyman__team__team_name__exact='dev-cms').count()
		api_bugs = Issue.objects.filter(bugyman__team__team_name__exact='platform').count()
		cp_bugs = Issue.objects.filter(bugyman__team__team_name__exact='dev-cp').count()
		

		design_jobs = SprintJob.objects.filter(developers__in=Member.objects.filter(team__team_name__exact='design')).distinct().count()
		cms_jobs = SprintJob.objects.filter(developers__in=Member.objects.filter(team__team_name__exact='dev-cms')).distinct().count()
		api_jobs = SprintJob.objects.filter(developers__in=Member.objects.filter(team__team_name__exact='platform')).distinct().count()
		cp_jobs = SprintJob.objects.filter(developers__in=Member.objects.filter(team__team_name__exact='dev-cp')).distinct().count()
		
		try:
			design_avg = format(float(design_bugs)/design_jobs,'.2f')
		except ZeroDivisionError:
			design_avg = 0;
			
		try:
			api_avg = format(float(api_bugs)/api_jobs,'.2f')
		except ZeroDivisionError:
			api_avg = 0
		try:
			cms_avg = format(float(cms_bugs)/cms_jobs,'.2f')
		except ZeroDivisionError:
			cms_avg = 0;
		try:
			cp_avg = format(float(cp_bugs)/cp_jobs,'.2f')
		except ZeroDivisionError:
			cp_avg = 0;
			#import pdb; pdb.set_trace();
		return_dict = {'design': float(design_avg),'api': float(api_avg), 'cms': float(cms_avg), 'cp': float(cp_avg) }
		json = simplejson.dumps(return_dict)
		return HttpResponse(json, mimetype="application/x-javascript")
			
	else:
	 	return HttpResponse('Ajax was not called!')

def teamperformance(request):	
	if request.is_ajax():
		sprints = Sprint.objects.all()
		teams = Team.objects.all()
		mydata = []
		DATE_FORMAT = "%Y-%m-%d"
		#date_format = formats.get_format('DATE_FORMAT')

		for team in teams:
			performance = {}
			performance['name'] = team.team_name
			avg_data = []
			for sp in sprints:
				team_avg = float(find(sp.pk, team.team_name))
				avg_data.append(team_avg)
				performance['sprint'] = sp.release_date.strftime(DATE_FORMAT)
			performance['data'] = avg_data
			mydata.append(performance)
			
		result = json.dumps(mydata)
		return HttpResponse(result, mimetype="application/x-javascript")
	else:
		return HttpResponse('Ajax was not called!')

def memberperformance(request):
	#import pdb; pdb.set_trace()
	#if request.is_ajax():
	mydata = []
	members = Member.objects.all()	
	for member in members:
		bugs = Issue.objects.filter(bugyman__name__exact=member.name).count()
		jobs = SprintJob.objects.filter(developers__in=[member]).count()

		
	return_dict = {'design': float(design_avg),'api': float(api_avg), 'cms': float(cms_avg), 'cp': float(cp_avg) }
	json = simplejson.dumps(return_dict)
	return HttpResponse(json, mimetype="application/x-javascript")
	#return HttpResponse('This is members bug')


def find(sp_id,team_name):
	#return HttpResponse('Sprint id %s & team name %s' % (sp_id, team_name))
	#import pdb; pdb.set_trace()
	bugs = Issue.objects.filter(bugyman__team__team_name__exact=team_name, sprint__id__exact=sp_id).count()
	jobs = SprintJob.objects.filter(sprint__id__exact=sp_id, developers__in=Member.objects.filter(team__team_name__exact=team_name)).count()
	try:
		team_avg = format(float(bugs)/jobs, '.2f')
	except ZeroDivisionError:
		team_avg = 0;

	return team_avg
	

def teamsbug(request):
	if not request.is_ajax():

		teams = Team.objects.all()	
		teams_bugs = []
		#import pdb; pdb.set_trace()
		for team in teams:
			team_bugs = {}
			bugs = Issue.objects.filter(bugyman__team__team_name__exact=team.team_name)
			team_bugs['name'] = team.team_name
			team_bugs['bugs'] = bugs
			teams_bugs.append(team_bugs)
		sprints = Sprint.objects.all()

		return render_to_response('bugs/teamsbug.html',{'teams_bugs':teams_bugs, 'sprints': sprints}, context_instance=RequestContext(request) )
	else:
		teams = Team.objects.all()	
		teams_bugs = []
		sp_id = int(request.GET['sp_id'])
		
		for team in teams:
			team_bugs = {}
			if sp_id != 0:
				bugs = Issue.objects.filter(bugyman__team__team_name__exact=team.team_name, sprint__pk=sp_id)
			else:
				bugs = Issue.objects.filter(bugyman__team__team_name__exact=team.team_name)
			team_bugs['name'] = team.team_name
			team_bugs['bugs'] = bugs
			teams_bugs.append(team_bugs)
		sprints = Sprint.objects.all()

		return render_to_response('bugs/partial/teamsbug.html',{'teams_bugs':teams_bugs, 'sprints': sprints}, context_instance=RequestContext(request) )


def individualbugs(request):

	if not request.is_ajax():
		members = Member.objects.all()	
		members_bugs = []
		#import pdb; pdb.set_trace()
		for member in members:
			individual_bugs = {}
			bugs = Issue.objects.filter(bugyman__name__exact=member.name)
			individual_bugs['name'] = member
			individual_bugs['bugs'] = bugs
			members_bugs.append(individual_bugs)

		sprints = Sprint.objects.all()
		return render_to_response('bugs/individualbugs.html',{'members_bugs': members_bugs, 'sprints': sprints},context_instance=RequestContext(request) )
	else:
		sp_id = int(request.GET['sp_id'])		
		members = Member.objects.all()	
		members_bugs = []
		for member in members:
			individual_bugs = {}
			if sp_id != 0:
				bugs = Issue.objects.filter(bugyman__name__exact=member.name, sprint__pk=sp_id)
			else:
				bugs = Issue.objects.filter(bugyman__name__exact=member.name)

			individual_bugs['name'] = member
			individual_bugs['bugs'] = bugs
			members_bugs.append(individual_bugs)

		sprints = Sprint.objects.all()
		return render_to_response('bugs/partial/individualbugs.html',{'members_bugs': members_bugs, 'sprints': sprints}, context_instance=RequestContext(request))

def tperformance(request):
	return render_to_response('bugs/tperformance.html',{}, context_instance=RequestContext(request))

def iperformance(request):
	return render_to_response('bugs/iperformance.html',{}, context_instance=RequestContext(request))

def bugsperperson(request):
	#import pdb; pdb.set_trace();	
	if request.is_ajax():	
		return_dict = {}
		members = Member.objects.all()
		for member in members:	
			name = member.name
			bugs = Issue.objects.filter(bugyman__name__exact=name).count()
			jobs = SprintJob.objects.filter(developers__in=[member]).count()
			if not jobs == 0:
				return_dict[name] = bugs

		json = simplejson.dumps(return_dict)	
		return HttpResponse(json, mimetype="application/x-javascript")
	else:
	 	return HttpResponse('Ajax was not called!')

def avgbugsbyperson(request):
	if request.is_ajax():	
		#import pdb; pdb.set_trace();
		return_dict = {}
		members = Member.objects.all()
		for member in members:			
			name = member.name
			bugs = Issue.objects.filter(bugyman__name__exact=name).count()
			jobs = SprintJob.objects.filter(developers__in=[member]).count()
			if not jobs == 0:
				avg_bug = format(float(bugs)/jobs, '.2f')			
				return_dict[name] = avg_bug

		json = simplejson.dumps(return_dict)	
		return HttpResponse(json, mimetype="application/x-javascript")
	else:
	 	return HttpResponse('Ajax was not called!')

def repbugsperteam(request):
	msg = 'Comming soon....'
	return render_to_response('bugs/repbugsperteam.html',{'msg': msg}, context_instance=RequestContext(request))

def repbugsperpro(request):
	msg = 'Comming soon....'
	return render_to_response('bugs/repbugsperpro.html',{'msg': msg}, context_instance=RequestContext(request))

def clientbugs(request):
	msg = 'Comming soon....'
	return render_to_response('bugs/clientbugs.html',{'msg': msg}, context_instance=RequestContext(request))
