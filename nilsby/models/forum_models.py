from sqlalchemy import Column
from sqlalchemy import Integer
from sqlalchemy import String
from sqlalchemy import Text
from sqlalchemy import ForeignKey
from sqlalchemy import DateTime

from sqlalchemy.orm import relationship, backref

from nilsby.models import Base

class ForumPost(Base):
    __tablename__ = 'forumposts'
    id = Column(Integer, primary_key=True)
    title = Column(String(255))
    text = Column(Text())
    post_time = Column(DateTime())

    poster_id = Column(Integer, ForeignKey('people.id'))
    poster = relationship("Person", backref=backref('forum_posts'))

    def __init__(self, title, text):
        self.title = title
        self.text = text

class ForumReply(Base):
    __tablename__ = 'forumreplies'
    id = Column(Integer, primary_key=True)
    #title = Column(String(255))
    text = Column(Text())

    post_id = Column(Integer, ForeignKey('forumposts.id'))
    post = relationship("ForumPost", backref=backref('replies'))

    def __init__(self, text):
        self.text = text


