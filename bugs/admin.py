from django.contrib import admin

from bugs.models import *

admin.site.register(Scenario)
admin.site.register(Feature)
admin.site.register(Module)
admin.site.register(Bug)
admin.site.register(Team)
admin.site.register(Member)
admin.site.register(Sprint)
admin.site.register(Issue)
admin.site.register(Comment)
admin.site.register(SprintJob)