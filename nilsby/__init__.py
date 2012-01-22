from pyramid.config import Configurator
from pyramid.session import UnencryptedCookieSessionFactoryConfig
from sqlalchemy import engine_from_config

from nilsby.models import initialize_sql

def main(global_config, **settings):
    """ This function returns a Pyramid WSGI application.
    """
    engine = engine_from_config(settings, 'sqlalchemy.')
    initialize_sql(engine)
    session_factory = UnencryptedCookieSessionFactoryConfig('nilsbysite')
    config = Configurator(settings=settings, session_factory=session_factory)
    config.add_static_view('static', 'nilsby:static', cache_max_age=3600)
    config.add_route('home', '/')

    # Forum routes
    config.add_route('forum_index', '/forum')
    config.add_route('forum_view', '/forum/view/{id}')
    config.add_route('forum_post', '/forum/post')
    config.add_route('forum_reply', '/forum/reply/{post_id}')

    # Profile routes
    config.add_route('profile', '/profile')
    config.scan()
    return config.make_wsgi_app()

