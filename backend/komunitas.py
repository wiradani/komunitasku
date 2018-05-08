import MySQLdb


class Komunitas:
    # add db.close() after end
    def __init__(self):
        self.db = MySQLdb.connect(user="root",passwd="",db="KomunitasKu",unix_socket="/opt/lampp/var/mysql/mysql.sock")
        self.cursor = self.db.cursor()


    def updateKomunitas(self,id_komunitas,nama_komunitas,deskripsi_komunitas):
        list_arg=[nama_komunitas,deskripsi_komunitas]
        val_arg=[]
        if list_arg[0]!="":
            val_arg.append("nama_komunitas='"+nama_komunitas+"'")
        if list_arg[1]!="":
            val_arg.append("deskripsi_komunitas='"+deskripsi_komunitas+"'")
    
        val=','.join(val_arg)
        sql='update komunitas set '+val+' where id_komunitas='+str(id_komunitas)+';'

        try:
            self.cursor.execute(sql)
            self.db.commit()
            return True
        except:
            self.db.rollback()
            return False

    def getALl(self):
        sql='select * from komunitas'
        self.cursor.execute(sql)
        res = self.cursor.fetchall()
        return res 


