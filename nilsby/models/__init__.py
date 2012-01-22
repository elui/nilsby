import transaction

from sqlalchemy import Column
from sqlalchemy import Integer
from sqlalchemy import String
from sqlalchemy import Text
from sqlalchemy import ForeignKey
from sqlalchemy import DateTime

from sqlalchemy.exc import IntegrityError
from sqlalchemy.ext.declarative import declarative_base

from sqlalchemy.orm import scoped_session
from sqlalchemy.orm import sessionmaker

from zope.sqlalchemy import ZopeTransactionExtension

DBSession = scoped_session(sessionmaker(extension=ZopeTransactionExtension()))
Base = declarative_base()

class Person(Base):
    __tablename__ = 'people'
    id = Column(Integer, primary_key=True)
    username = Column(String(255), unique=True)
    realname = Column(String(255))
    about = Column(Text())

    def __init__(self, uname, rname):
        self.username = uname
        self.realname = rname


from nilsby.models.forum_models import *

def populate():
    session = DBSession()
    model = Person('fyhuang', 'Frank')
    model.forum_posts.append(ForumPost('This is a test'))
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