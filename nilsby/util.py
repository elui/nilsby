import hashlib

from pyramid.httpexceptions import HTTPUnauthorized

def is_logged_in(request):
    if 'user' not in request.session or request.session['user'] is None:
        return False
    return True

def require_logged_in(request):
    if not is_logged_in(request):
        raise HTTPUnauthorized()

def hashed_password(pw):
    return hashlib.sha512("456{0}salt123".format(pw)).hexdigest()

