import MySQLdb


class Rewards:
    # add db.close() after end
    def __init__(self):
        self.db = MySQLdb.connect(user="root",passwd="",db="KomunitasKu",unix_socket="/opt/lampp/var/mysql/mysql.sock")
        self.cursor = self.db.cursor()

    def createReward(self,nama_reward,deskripsi_reward,syarat_point):
        list_arg = [nama_reward,deskripsi_reward,syarat_point]
        val = '","'.join(list_arg)
        sql='insert into reward(nama_reward,deskripsi_reward,syarat_point) values ("'+val+'")'
        try:
            self.cursor.execute(sql)
            self.db.commit()
            print("berhasil")
        except:
            print("error")
            self.db.rollback()
        return "ok data berhasil ditambah"

    def deleteReward(self,id_reward):
        sql='DELETE from reward where id_reward='+str(id_reward)+';'
        try:
            self.cursor.execute(sql)
            self.db.commit()
            print("berhasil")
        except:
            print("error")
            self.db.rollback()
        return  "data berhasil dihapus"

    def updateReward(self,id_reward,nama_reward,deskripsi_reward,syarat_point):
        list_arg=[nama_reward,deskripsi_reward,syarat_point]
        val_arg=[]
        if list_arg[0]!="":
            val_arg.append("nama_reward='"+nama_reward+"'")
        if list_arg[1]!="":
            val_arg.append("deskripsi_reward='"+deskripsi_reward+"'")
        if list_arg[2]!="":
            val_arg.append("syarat_point='"+syarat_point+"'")

        val=','.join(val_arg)
        sql='update reward set '+val+' where id_reward='+str(id_reward)+';'

        try:
            self.cursor.execute(sql)
            self.db.commit()
            return True
        except:
            self.db.rollback()
            return False
