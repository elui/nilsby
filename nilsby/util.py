import hashlib

from pyramid.httpexceptions import HTTPUnauthorized

from nilsby.models import Person

def is_logged_in(request):
    if 'user_id' not in request.session or request.session['user_id'] is None:
        return False
    return True

def require_logged_in(request, db):
    if not is_logged_in(request):
        raise HTTPUnauthorized()
    user = db.query(Person).filter_by(id=request.session['user_id']).first()
    return user

def hashed_password(pw):
    return hashlib.sha512("456{0}salt123".format(pw)).hexdigest()

