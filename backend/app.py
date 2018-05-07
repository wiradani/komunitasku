from flask import Flask,request,jsonify
from user import User
from rewards import  Rewards
from komunitas import Komunitas

app = Flask(__name__)
user = User()
reward = Rewards()
Komunitas = Komunitas()

@app.route("/")
def hello():
    return "Hello FLASK is running"

@app.route('/createUser',methods=['POST','GET'])
def createUser():
    if request.method == "POST":
        nama = request.form["nama"]
        username = request.form["username"]
        password = request.form["password"]
        email = request.form["email"]
        role = request.form["role"]
        res = user.createUser(nama,username,password,email,role)
        message = {
            'status': 200,
            'message': 'success',
            'data' : [nama,username,password,email,role]
        }
        return jsonify(message)
    else:
        return "must be POST method"


@app.route('/deleteUser',methods=['POST','GET'])
def deleteUser():
    if request.method == "POST":
        id_user = request.form["id_user"]
        res = user.deleteUser(id_user)
        message = {
            'status': 200,
            'message': 'success',
        }
        return jsonify(message)
    else:
        return "must be POST method"

@app.route('/updateUser',methods=['POST','GET'])
def updateUser():
    if request.method == "POST":
        id_user = request.form["id_user"]
        nama = request.form["nama"]
        username = request.form["username"]
        password = request.form["password"]
        email = request.form["email"]
        role = request.form["role"]

        res = user.updateUser(id_user, nama,username,password,email,role)
        message = {
            'status': 200,
            'message': 'success',
            'data' : [id_user,nama,username,password,email,role]
        }
        if res:
            return jsonify(message)
        else:
            return "NO"
    else:
        return "must be POST method"

@app.route('/createReward',methods=['POST','GET'])
def createReward():
    if request.method == "POST":
        nama_reward = request.form["nama_reward"]
        deskripsi_reward = request.form["deskripsi_reward"]
        syarat_point = request.form["syarat_point"]
        res = reward.createReward(nama_reward,deskripsi_reward,syarat_point)
        message = {
            'status': 200,
            'message': 'success',
            'data' : [nama_reward,deskripsi_reward,syarat_point]
        }
        return jsonify(message)
    else:
        return reward.createReward("test","test","100")

@app.route('/deleteReward',methods=['POST','GET'])
def deleteReward():
    if request.method == "POST":
        id = request.form["id_reward"]
        res = reward.deleteReward(id)
        message = {
            'status': 200,
            'message': 'success',
        }
        return jsonify(message)
    else:
        return "must be POST method"

@app.route('/updateReward',methods=['POST','GET'])
def updateReward():
    if request.method == "POST":
        id_reward = request.form["id_reward"]
        nama_reward = request.form["nama_reward"]
        deskripsi_reward = request.form["deskripsi_reward"]
        syarat_point = request.form["syarat_point"]
        res = reward.updateReward(id_reward,nama_reward,deskripsi_reward,syarat_point)
        message = {
            'status': 200,
            'message': 'success',
            'data' : [id_reward,nama_reward,deskripsi_reward,syarat_point]
        }
        if res:
            return jsonify(message)
        else:
            return "NO"
    else:
        return "must be POST method"

@app.route('/updateKomunitas',methods=['POST','GET'])
def updateKomunitas():
    if request.method == "POST":
        id_komunitas = request.form["id_komunitas"]
        nama_komunitas = request.form["nama_komunitas"]
        deskripsi_komunitas = request.form["deskripsi_komunitas"]
        res = Komunitas.updateKomunitas(id_komunitas,nama_komunitas,deskripsi_komunitas)
        message = {
            'status': 200,
            'message': 'success',
            'data' : [id_komunitas,nama_komunitas,deskripsi_komunitas]
        }
        if res:
            return jsonify(message)
        else:
            return "Ups something wrong"
    else:
        return "must be POST method"



if __name__ == '__main__':
    app.run(debug=True)
