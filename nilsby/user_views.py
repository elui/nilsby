from pyramid.view import view_config

from nilsby.models import DBSession
from nilsby.models import *

@view_config(route_name='user_index', renderer='user_index.mako')
def user_index(request):
    dbsession = DBSession()
    people = dbsession.query(Person)
    return {'people': people, 'project':'nilsby'}
    
@view_config(route_name='user_view', renderer='user_view.mako')
def user_view(request):
    dbsession = DBSession()
    people = dbsession.query(Person)
    return {'people': people, 'project':'nilsby'}
