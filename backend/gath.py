import MySQLdb
from event import Event

class Gath(Event):
    def __init__(self,id_gath,materi,lokasi,waktu):
        self.db = MySQLdb.connect(user="root",passwd="",db="KomunitasKu",unix_socket="/opt/lampp/var/mysql/mysql.sock")
        self.cursor = self.db.cursor()
        self.id_gath = id_gath
        self.materi = materi
        self.lokasi = lokasi
        self.waktu = waktu
