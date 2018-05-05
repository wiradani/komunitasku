import MySQLdb


class Rewards:
    # add db.close() after end
    def __init__(self):
        self.db = MySQLdb.connect(user="root",passwd="",db="KomunitasKu",unix_socket="/opt/lampp/var/mysql/mysql.sock")
        self.cursor = self.db.cursor()

    def membuatReward(self,nama_reward,deskripsi_reward,syarat_point):
        list_arg = [nama_reward,deskripsi_reward,syarat_point]
        val = '","'.join(list_arg)
        sql='insert into reward(nama_reward,deskripsi_reward,syarat_point,email) values ("'+val+'")'
        try:
            self.cursor.execute(sql)
            self.db.commit()
            print("berhasil")
        except:
            print("error")
            self.db.rollback()
        return "ok data berhasil ditambah"
