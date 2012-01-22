import transaction

from pyramid.view import view_config

from pyramid.httpexceptions import HTTPFound

from nilsby.util import require_logged_in
from nilsby.models import DBSession
from nilsby.models import *

@view_config(route_name='forum_index', renderer='forum_index.mako')
def forum_index(request):
    db = DBSession()
    posts = db.query(ForumPost).order_by(ForumPost.post_time)
    return {'posts': posts}

@view_config(route_name='forum_view', renderer='forum_view.mako')
def forum_view(request):
    db = DBSession()
    post = db.query(ForumPost).filter(ForumPost.id==request.matchdict['id']).first()
    return {'post': post}

@view_config(route_name='forum_post', renderer='forum_post.mako')
def forum_post(request):
    require_logged_in(request)
    if 'action' in request.POST and request.POST['action'] == 'post':
        db = DBSession()
        post = ForumPost(request.POST['title'], request.POST['text'])
        db.add(post)
        db.flush()
        return HTTPFound(location=request.route_url('forum_view', id=post.id))
    return {}

@view_config(route_name='forum_reply')
def forum_reply(request):
    require_logged_in(request)
    db = DBSession()
    reply = ForumReply(request.POST['text'])
    reply.post_id = request.matchdict['post_id']
    db.add(reply)
    db.flush()
    return HTTPFound(location=request.route_url('forum_view', id=request.matchdict['post_id']))
