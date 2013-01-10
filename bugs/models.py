from django.db import models

# Create your models here.
BUGTYPE = (
		(u'api', u'API'),
		(u'dev', u'Developer'),
		(u'design', u'Designer'),
	)
PROJECT_TYPE = (
		(u'cms',u'CMS'),
		(u'api',u'Platform'),
		(u'cpanel',u'Control Panel'),
		(u'website',u'Web Site'),
		(u'clientIssue',u'Client Issue'),
	)
ISSUE_STATUS = (
		(u'resolved',u'Resolved'),
		(u'ignored',u'Ignored'),
		(u'notresolved',u'Not Resolved'),
	)
JOB_OWNER = (
		(u'investor',u'NewsCred Investor'),
		(u'management',u'NewsCred Management'),
		(u'client',u'NewsCred Client'),
	)
JOB_TYPE = (
		(u'newproject',u'New Project'),
		(u'newfeature',u'New Feature'),
		(u'changefeature',u'Change Feature'),
		(u'bugfix',u'Bug Fixing'),
	)

class Scenario(models.Model):
	title = models.CharField(max_length=200)
	desc = models.TextField(blank=True)

	def __unicode__(self):
		return self.title

class Feature(models.Model):
	name = models.CharField(max_length=100)
	scenario = models.ManyToManyField(Scenario)	

	def __unicode__(self):
		return self.name

class Module(models.Model):
	name = models.CharField(max_length=50)
	feature = models.ManyToManyField(Feature)

	def __unicode__(self):
		return self.name


class Bug(models.Model):
	title = models.CharField(max_length=200)
	description = models.TextField()
	bug_type = models.CharField(max_length=20, choices=BUGTYPE)
	screeshot = models.ImageField(upload_to='bugs', blank=True, null=True)
	date = models.DateField()
	module = models.ForeignKey(Module)
	feature = models.ForeignKey(Feature)
	scenario = models.ForeignKey(Scenario)

	def __unicode__(self):
		return self.title

class Team(models.Model):
	team_name = models.CharField(max_length=20)
	slogan = models.CharField(max_length=50)
	team_icon = models.ImageField(upload_to='team_icon', blank=True, null=True)

	def __unicode__(self):
		return self.team_name

class Member(models.Model):
	name = models.CharField(max_length=50)
	codename = models.CharField(max_length=20)
	avatar = models.ImageField(upload_to='avatar', blank=True, null=True)
	team = models.ForeignKey(Team)
	team_lead = models.BooleanField()

	def __unicode__(self):
		return self.name

class Sprint(models.Model):
	start_date = models.DateField()
	release_date = models.DateField()
	description = models.TextField()

	def __unicode__(self):
		return unicode(self.release_date)


class SprintJob(models.Model):
	title = models.CharField(max_length=200)
	job_type = models.CharField(max_length=25, choices=JOB_TYPE)
	project_type = models.CharField(max_length=15, choices=PROJECT_TYPE)
	project_title = models.CharField(max_length=50)
	jira_ticket = models.CharField(max_length=25)
	description = models.TextField()
	developers = models.ManyToManyField(Member)
	#designer = models.ManyToManyField(Member)
	job_owner = models.CharField(max_length=20, choices=JOB_OWNER)
	sprint = models.ForeignKey(Sprint)
	#finished_working = models.ForeignKey(Sprint)

	def __unicode__(self):
		return self.title


class Issue(models.Model):
	bug = models.ForeignKey(Bug)
	desc = models.TextField(max_length=200)
	status = models.CharField(max_length=15, choices=ISSUE_STATUS)
	date = models.DateField(blank=True)
	screenshot = models.ImageField(upload_to='issue', blank=True, null=True)
	sprint = models.ForeignKey(Sprint)
	sprintjob = models.ForeignKey(SprintJob)
	bugyman = models.ForeignKey(Member)
	

	def __unicode__(self):
		return self.bug.title


class Comment(models.Model):
	description = models.TextField()
	issues = models.ForeignKey(Issue)
	def __unicode__(self):
		return self.description