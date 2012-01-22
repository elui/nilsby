from pyramid.view import view_config

from nilsby.models import DBSession
from nilsby.models import *

@view_config(route_name='forum_index', renderer='forum_index.mako')
def forum_index(request):
    db = DBSession()
    posts = db.query(ForumPost).order_by(ForumPost.post_time)
    return {'posts': posts}
