from pyramid.view import view_config

from nilsby.models import DBSession
from nilsby.models import *

@view_config(route_name='home', renderer='test.mako')
def my_view(request):
    dbsession = DBSession()
    people = dbsession.query(Person)
    return {'people': people, 'project':'nilsby'}
