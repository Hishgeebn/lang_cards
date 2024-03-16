from sqlalchemy import Column, String, Integer, ForeignKey
from sqlalchemy.orm import declarative_base, relationship

Base = declarative_base()


class Language(Base):
    __tablename__ = "languages"
    id = Column(Integer, primary_key=True)
    name = Column(String(50))
    words = relationship("Word", back_populates="language") 


class Word(Base):
    __tablename__ = "words"
    id = Column(Integer, primary_key=True)
    w_desc = Column(String, unique=True)
    translation = Column(String)
    language_id = Column(Integer, ForeignKey("languages.id")) 
    language = relationship("Language", back_populates="words")