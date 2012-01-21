import transaction

from sqlalchemy.orm import scoped_session
from sqlalchemy.orm import sessionmaker

from sqlalchemy.ext.declarative import declarative_base

from sqlalchemy.exc import IntegrityError

from sqlalchemy import Integer
from sqlalchemy import Unicode
from sqlalchemy import Column

from zope.sqlalchemy import ZopeTransactionExtension

DBSession = scoped_session(sessionmaker(extension=ZopeTransactionExtension()))
Base = declarative_base()


class Person(Base):
    __tablename__ = "people"
    id = Column(Integer, primary_key=True)
    username = Column(Unicode(255), unique=True)
    realname = Column(Unicode(255))

    def __init__(self, username, realname):
        self.username = username
        self.realname = realname

class MyRoot(object):
    __name__ = None
    __parent__ = None

    def __getitem__(self, key):
        session= DBSession()
        try:
            id = int(key)
        except (ValueError, TypeError):
            raise KeyError(key)

        item = session.query(Person).get(id)
        if item is None:
            raise KeyError(key)

        item.__parent__ = self
        item.__name__ = key
        return item

    def get(self, key, default=None):
        try:
            item = self.__getitem__(key)
        except KeyError:
            item = default
        return item

    def __iter__(self):
        session= DBSession()
        query = session.query(Person)
        return iter(query)

root = MyRoot()

def root_factory(request):
    return root

def populate():
    session = DBSession()
    model = Person(username='fyhuang', realname='Frank')
    session.add(model)
    session.flush()
    transaction.commit()

def initialize_sql(engine):
    DBSession.configure(bind=engine)
    Base.metadata.bind = engine
    Base.metadata.create_all(engine)
    try:
        populate()
    except IntegrityError:
        transaction.abort()
    return DBSession

def appmaker(engine):
    initialize_sql(engine)
    return root_factory
