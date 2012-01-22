from pyramid.view import view_config

from nilsby.models import DBSession
from nilsby.models import *

def get_session():
    dbsession = DBSession()
    return dbsession

@view_config(route_name='home', renderer='test.mako')
def my_view(request):
    dbsession = get_session()
    people = dbsession.query(Person)
    return {'people': people, 'project':'nilsby'}

@view_config(route_name='profile', renderer='profile.mako')
def my_view(request):
    dbsession = get_session()
    person[0] = dbsession.query(Person)
    return {'person': person }