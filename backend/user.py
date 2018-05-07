import MySQLdb


class User:
    # add db.close() after end
    def __init__(self):
        self.db = MySQLdb.connect(user="root",passwd="",db="KomunitasKu",unix_socket="/opt/lampp/var/mysql/mysql.sock")
        self.cursor = self.db.cursor()

    def createUser(self,nama,username,password,email,role):
        list_arg = [nama,username,password,email,role]
        val = '","'.join(list_arg)
        sql='insert into user(nama,username,password,email,role) values ("'+val+'")'
        try:
            self.cursor.execute(sql)
            self.db.commit()
            print("berhasil")
        except:
            print("error")
            self.db.rollback()
        return "ok data berhasil ditambah"

    def deleteUser(self,id_user):
        sql='DELETE from user where id_user='+str(id_user)+';'
        try:
            self.cursor.execute(sql)
            self.db.commit()
            print("berhasil")
        except:
            print("error")
            self.db.rollback()
        return  "data berhasil dihapus"


    def updateUser(self,id_user, nama,username,password,email,role):
        list_arg=[nama,nama,username,password,email,role]
        val_arg=[]
        if list_arg[0]!="":
            val_arg.append("nama='"+nama+"'")
        if list_arg[1]!="":
            val_arg.append("username='"+username+"'")
        if list_arg[2]!="":
            val_arg.append("password='"+password+"'")
        if list_arg[3]!="":
            val_arg.append("email='"+email+"'")
        if list_arg[4]!="":
            val_arg.append("daftar_komunitas='"+role+"'")

        val=','.join(val_arg)
        sql='update user set '+val+' where id_user='+str(id_user)+';'

        try:
            self.cursor.execute(sql)
            self.db.commit()
            return True
        except:
            self.db.rollback()
            return False






