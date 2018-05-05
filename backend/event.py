import MySQLdb


class Rewards:
    # add db.close() after end
    def __init__(self):
        self.db = MySQLdb.connect(user="root",passwd="",db="KomunitasKu",unix_socket="/opt/lampp/var/mysql/mysql.sock")
        self.cursor = self.db.cursor()
