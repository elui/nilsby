from pyramid.view import view_config

from pyramid.httpexceptions import HTTPFound

from nilsby.models import DBSession
from nilsby.models import *

def get_session():
    dbsession = DBSession()
    return dbsession

@view_config(route_name='home', renderer='home.mako')
def home(request):
    return {}

def hashed_password(pw):
    return hashlib.sha512("456{0}salt123".format(pw)).hexdigest()

@view_config(route_name='login')
def login_view(request):
    db = get_session()
    if 'username' in request.POST:
        # TODO: login
        pw_hash = hashed_password(request.POST['password'])
        user = db.query(Person).\
                filter(Person.username==request.POST['username']).\
                filter(Person.password_hash==pw_hash).first()
        if user is not None:
            request.session['user'] = user
            request.session.flash("Welcome back, {0}".format(user.username))
        else:
            request.session.flash("Incorrect login credentials, please try again")
    return HTTPFound(location=request.route_url('home'))

@view_config(route_name='logout')
def logout_view(request):
    request.session['user'] = None
    del request.session['user']
    request.session.flash("Logged out")
    return HTTPFound(location=request.route_url('home'))
