from pyramid.view import view_config

from nilsby.models import DBSession
from nilsby.models import MyModel

@view_config(route_name='home', renderer='templates/mytemplate.pt')
def my_view(request):
    dbsession = DBSession()
    root = dbsession.query(MyModel).filter(MyModel.name==u'root').first()
    return {'root':root, 'project':'nilsby'}
