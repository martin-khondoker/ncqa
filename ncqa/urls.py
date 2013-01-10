from django.conf.urls import patterns, include, url
from django.conf import settings
# Uncomment the next two lines to enable the admin:
from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    

    url(r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT}),
    
    url(r'^bugs/$', 'bugs.views.bugs', name='bugs'),


    url(r'^ajax/$', 'ncqa.views.ajax', name='ajax'),

    url(r'^addbug/$', 'bugs.views.addbug', name='addbug'),
    url(r'^listbugs/$', 'bugs.views.listbugs', name='listbugs'),
    url(r'^bugdetails/$', 'bugs.views.bugdetails', name='bugdetails'),

    url(r'^addteam/$', 'bugs.views.addteam', name='addteam'),
    url(r'^listteams/$', 'bugs.views.listteams', name='listteams'),

    url(r'^addmember/$', 'bugs.views.addmember', name='addmember'),
    url(r'^listmembers/$', 'bugs.views.listmembers', name='listmembers'),

    url(r'^addsprint/$', 'bugs.views.addsprint', name='addsprint'),
    url(r'^listsprints/$', 'bugs.views.listsprints', name='listsprints'),

    url(r'^addsprintjob/$', 'bugs.views.addsprintjob', name='addsprintjob'),
    url(r'^listsprintjobs/$', 'bugs.views.listsprintjobs', name='listsprintjobs'),

    url(r'^addissue/$', 'bugs.views.addissue', name='addissue'),
    url(r'^listissues/$', 'bugs.views.listissues', name='listissues'),
    url(r'^issuedetails/(?P<issue_id>\d+)/$', 'bugs.views.issuedetails', name='issuedetails'),

    url(r'^listbugsperteam/$', 'bugs.views.listbugsperteam', name='listbugsperteam'),
    url(r'^bugsperjob/$', 'bugs.views.bugsperjob', name='bugsperjob'),
    url(r'^bugspermember/$', 'bugs.views.bugspermember', name='bugspermember'),

    url(r'^bugsperteam/$', 'bugs.views.bugsperteam', name='bugsperteam'),
    url(r'^avgbugsperteam/$', 'bugs.views.avgbugsperteam', name='avgbugsperteam'),
    url(r'^teamperformance/$', 'bugs.views.teamperformance', name='teamperformance'),

    url(r'^iperformance/$', 'bugs.views.iperformance', name='iperformance'),
    url(r'^bugsperperson/$', 'bugs.views.bugsperperson', name='bugsperperson'),
    url(r'^avgbugsbyperson/$', 'bugs.views.avgbugsbyperson', name='avgbugsbyperson'),
    url(r'^memberperformance/$', 'bugs.views.memberperformance', name='memberperformance'),

    url(r'^tperformance/$', 'bugs.views.tperformance', name='tperformance'),
    url(r'^bugsperteam/$', 'bugs.views.bugsperteam', name='bugsperteam'),
    
    #url(r'^bugs/$', 'bugs.views.home', name='home'),
    url(r'^find/(?P<sp_id>\d{2})/(?P<team_name>[a-z]+)/$', 'bugs.views.find', name='find'),
    # url(r'^ncqa/', include('ncqa.foo.urls')),

    url(r'^teamsbug/$', 'bugs.views.teamsbug', name='teamsbug'),
    url(r'^individualbugs/$', 'bugs.views.individualbugs', name='individualbugs'),
    url(r'^repbugsperteam/$', 'bugs.views.repbugsperteam', name='repbugsperteam'),
    url(r'^repbugsperpro/$', 'bugs.views.repbugsperpro', name='repbugsperpro'),
    url(r'^clientbugs/$', 'bugs.views.clientbugs', name='clientbugs'),
    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),


    url(r'^login/$', 'ncqa.views.userLogin', name='userLogin'),
    url(r'^logout/$', 'ncqa.views.userLogout', name='userLogin'),
    url(r'^signup/$', 'ncqa.views.signup', name='signup'),
    url(r'^$', 'ncqa.views.home', name='home'),
    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),
)
