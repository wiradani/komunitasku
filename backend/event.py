import MySQLdb


class Event:
    def __init__(self):
        self.db = MySQLdb.connect(user="root",passwd="",db="KomunitasKu",unix_socket="/opt/lampp/var/mysql/mysql.sock")
        self.cursor = self.db.cursor()
        
        
    def createEvent(self,id_komunitas_FK,nama_event,reward_points,reward_xp,tipe):
        list_arg = [id_komunitas_FK,nama_event,reward_points,reward_xp,tipe]
        val = '","'.join(list_arg)
        sql='insert into event(id_komunitas_FK,nama_event,reward_points,reward_xp,tipe) values ("'+val+'")'
        try:
            self.cursor.execute(sql)
            self.db.commit()
            print("berhasil")
        except:
            print("error")
            self.db.rollback()
        return "ok data berhasil ditambah"
    

    def deleteEvent(self,id_event):
        sql='DELETE from event where id_event='+str(id_event)+';'
        try:
            self.cursor.execute(sql)
            self.db.commit()
            print("berhasil")
        except:
            print("error")
            self.db.rollback()
        return  "data berhasil dihapus"