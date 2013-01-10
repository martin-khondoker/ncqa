import os
import sys	
sys.path.append('/home/ubuntu/python/ncqa/')
os.environ['DJANGO_SETTINGS_MODULE'] = 'ncqa.settings'
import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()
