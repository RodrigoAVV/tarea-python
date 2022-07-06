import mysql.connector
class Database:
    def __init__(self):
        self.conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password='',
            db='bd-jugadores'
        )
        
    def ListJugadores(self):
        try:
            cursor = self.conn.cursor()
            cursor.execute("SELECT * FROM jugadores")
            jugadores = cursor.fetchall()
            return jugadores
        except Exception as err:
            print(err)
    
    def registrarJugador(self,jugador):
        cursor = self.conn.cursor()
        sql = "INSERT INTO JUGADORES (NOMBRE_J,ALIAS_J,TIPO,ESTADO) VALUES('{0}','{1}','{2}','{3}')"
        cursor.execute(sql.format(jugador[0],jugador[1],jugador[2],jugador[3]))
        self.conn.commit()
        print("OK")