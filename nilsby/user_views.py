from pyramid.view import view_config

from nilsby.models import DBSession
from nilsby.models import *

@view_config(route_name='user_index', renderer='user_index.mako')
def user_index(request):
    db = DBSession()
    people = db.query(Person)
    return {'people': people}
    
@view_config(route_name='user_view', renderer='user_view.mako')
def user_view(request):
    db = DBSession()
    person = db.query(Person).filter(Person.id==request.matchdict['id']).first()
    return {'person': person}

@view_config(route_name='user_view', renderer='user_view.mako')
    def user_view(request):
    db = DBSession()
    person = db.query(Person).filter(Person.id==request.matchdict['id']).first()
    return {'person': person}
