from sqlalchemy import create_engine, ForeignKey, Column, String, Integer, CHAR
from sqlalchemy.orm import declarative_base
from sqlalchemy.orm import sessionmaker


Base = declarative_base()

# create the first table in the database
class Person(Base):

    __tablename__ = "people"

    ssn = Column("ssn", Integer, primary_key=True)
    firstname = Column("firstname", String)
    lastname = Column("lastname", String)
    gender = Column("gender", CHAR)
    age = Column("age", Integer)

    def __init__(self, ssn, firstname, lastname, gender, age):

        self.ssn = ssn
        self.firstname = firstname
        self.lastname = lastname
        self.gender = gender
        self.age = age

    def __repr__(self):
        return f"{self.ssn}, {self.firstname}, {self.lastname}, {self.gender}, {self.age}."


# create the second table in the database
class Thing(Base):
    __tablename__ = "things"

    tid = Column("tid", Integer, primary_key=True)
    description = Column("description", String)
    owner = Column(Integer, ForeignKey("people.ssn"))  # create a foreign key

    def __init__(self, tid, description, owner):
        self.tid = tid
        self.description = description
        self.owner = owner

    def __repr__(self):
        return f"{self.tid}, {self.description}, {self.owner}"


engine = create_engine("sqlite:///mydb,db", echo=True)  # connect to the SQLite database

# Base.metadata.drop_all(bind=engine)  # Drop existing tables

Base.metadata.create_all(bind=engine)  # create the database

# insert data
Session = sessionmaker(bind=engine)
session = Session()


person1 = Person(ssn=123458, firstname="Loqman", lastname="Samani", gender="m", age=32)

session.add(person1)
session.commit()


person2 = Person(ssn=123452, firstname="Loqman", lastname="Fatehi", gender="m", age=32)
person3 = Person(ssn=123425, firstname="Ali", lastname="Ahmadi", gender="m", age=23)
person4 = Person(ssn=123145, firstname="Saman", lastname="Ebrahimi", gender="m", age=43)
person5 = Person(ssn=123445, firstname="Mina", lastname="Rahimi", gender="f", age=76)
person6 = Person(ssn=136745, firstname="Jaqub", lastname="Azizi", gender="m", age=12)
person7 = Person(ssn=298345, firstname="Yassin", lastname="Yazdani", gender="m", age=45)

session.add(person2)
session.add(person3)
session.add(person4)
session.add(person5)
session.add(person6)
session.add(person7)

session.commit()


t1 = Thing(tid=1, description="a new car", owner=person1.ssn)
t2 = Thing(tid=2, description=" bicycle", owner=person3.ssn)
t3 = Thing(tid=3, description="airplane", owner=person4.ssn)

session.add(t1)
session.add(t2)
session.add(t3)

session.commit()






# query in the Person table
result = session.query(Person).all()
print(result)
"""
[123145, Saman, Ebrahimi, m, 43., 
123425, Ali, Ahmadi, m, 23., 123445, 
Mina, Rahimi, f, 76., 
123452, Loqman, Fatehi, m, 32., 
123458, Loqman, Samani, m, 32., 
136745, Jaqub, Azizi, m, 12., 
298345, Yassin, Yazdani, m, 45.]

"""

result1 = session.query(Person).filter(Person.gender =="m")

for r in result1:
    print(r)
"""
123145, Saman, Ebrahimi, m, 43.
123425, Ali, Ahmadi, m, 23.
123452, Loqman, Fatehi, m, 32.
123458, Loqman, Samani, m, 32.
136745, Jaqub, Azizi, m, 12.
298345, Yassin, Yazdani, m, 45.
"""

result2 = session.query(Person).filter(Person.firstname == "Saman")

for r in result2:
    print(r)

"""
123145, Saman, Ebrahimi, m, 43.
"""


result3 = session.query(Person).filter(Person.age < 30)

for r in result3:
    print(r)

"""
123425, Ali, Ahmadi, m, 23.
136745, Jaqub, Azizi, m, 12.
"""

result4 = session.query(Person).filter(Person.firstname.like("%Lo%"))

for r in result4:
    print(r)

"""
123452, Loqman, Fatehi, m, 32.
123458, Loqman, Samani, m, 32.
"""

result5 = session.query(Person).filter(Person.lastname.in_(["Samani", "Azizi"]))

for r in result5:
    print(r)
"""
123458, Loqman, Samani, m, 32.
136745, Jaqub, Azizi, m, 12.
"""


result6 = session.query(Thing).all()
print(result6)
"""
[1, a new car, 123458, 
2,  bicycle, 123425, 
3, airplane, 123145]
"""


result6 = session.query(Thing, Person).filter(Thing.owner == Person.ssn).filter(Person.lastname == "Samani").all()

for r in result6:
    print(r)
""" (1, a new car, 123458, 123458, Loqman, Samani, m, 32.) """





