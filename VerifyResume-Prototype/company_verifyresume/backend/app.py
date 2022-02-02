# save this as app.py
from brownie import Contract
from flask import Flask,request
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS

app = Flask(__name__)
cors = CORS(app)
#app.config['CORS_HEADERS'] = 'Content-Type'


app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_DATABASE_URI']='sqlite:///db.sqlite3'
db = SQLAlchemy(app)

class Company(db.Model):
    id = db.Column(db.Integer,primary_key = True)
    name = db.Column(db.String)
    address = db.Column(db.String)
class Candidate(db.Model):
    id = db.Column(db.Integer,primary_key = True)
    name = db.Column(db.String)
    address = db.Column(db.String)
class Record(db.Model):
    id = db.Column( db.Integer, primary_key=True)
    company = db.Column(db.String)
    candidate = db.Column(db.String)
    network = db.Column(db.String)  
    contract_address = db.Column(db.String)
    token_id = db.Column(db.String)
'''
TO CREATE DATABASE AND TABLE
>>> python3
>>> from app import db
>>> db.create_all()
>>> exit() 
'''    

@app.route("/new_company", methods=['POST'])
def add_company():
    new_company = Company(name=request.form.get('name'),address=request.form.get('address'))
    db.session.add(new_company)
    db.session.commit()
    return "<h1>NEW COMPANY ADDED</h1>"

@app.route("/new_candidate", methods=['POST'])
def add_candidate():
    new_company = Candidate(name=request.form.get('name'),address=request.form.get('address'))
    db.session.add(new_company)
    db.session.commit()
    return "<h1>NEW CANDIDATE ADDED</h1>"

@app.route("/add_certificate", methods=['POST'])
def add_certificate():
    company = request.form.get('company')
    candidate = request.form.get('candidate')
    network = "POLYGON"
    contract_address = "0xF86C55Bf409BACCf552E8b9B1Ad9007600518E22"
    token_id = request.form.get("token_id")
    new_company = Record(company=company,candidate=candidate,network = network, contract_address=contract_address,token_id=token_id)
    db.session.add(new_company)
    db.session.commit()
    return "<h1>NEW CERTIFICATE ADDED</h1>"

if __name__ == "__main__":
    app.run(debug=True)