from pyramid.view import view_config

from pyramid.httpexceptions import HTTPFound

from nilsby.util import require_logged_in
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

@view_config(route_name='user_new', renderer='user_new.mako')
def user_new(request):
    if 'action' in request.POST and request.POST['action'] == 'post':
        db = DBSession()
        user = Person(request.POST['uname'], request.POST['rname'])
        db.add(user)
        db.flush()
        return HTTPFound(location=request.route_url('user_view', id=user.id))
    return {}
