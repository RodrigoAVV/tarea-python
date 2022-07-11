import mysql.connector
class Database:
    def __init__(self):
        self.conn = mysql.connector.connect(
            host='localhost',
            user='root',
            password='',
            db='bd-jugadores'
        )
    
    def login(self,datos):
        try:
            cursor = self.conn.cursor()
            sql = "SELECT ALIAS_J, PASSWORD FROM JUGADORES WHERE ALIAS_J = '{0}' AND PASSWORD = '{1}'"
            cursor.execute(sql.format(datos[0],datos[1]))
            data = cursor.fetchone()
            return data
        except Exception as err:
            print(err)


        
    def ListJugadores(self):
        try:
            cursor = self.conn.cursor()
            cursor.execute("SELECT * FROM jugadores")
            jugadores = cursor.fetchall()
            return jugadores
        except Exception as err:
            print(err)
    
    def registrarJugador(self,jugador):
        try:
            cursor = self.conn.cursor()
            sql = "INSERT INTO JUGADORES (NOMBRE_J,ALIAS_J,TIPO,ESTADO,PASSWORD) VALUES('{0}','{1}','{2}','{3}','{4}')"
            cursor.execute(sql.format(jugador[0],jugador[1],jugador[2],jugador[3],jugador[4]))
            self.conn.commit()
            print("OK")
        except Exception as err:
            print(err)

    def eliminarJugador(self,id):
        try:
            cursor = self.conn.cursor()
            sql = "DELETE FROM JUGADORES WHERE JUGADOR_ID = {0}"
            cursor.execute(sql.format(id))
            self.conn.commit()
            print("OK")
        except Exception as err:
            print(err)
        

    def actualizarJugador(self,jugador,id):
        try:
            cursor = self.conn.cursor()
            sql = "UPDATE JUGADORES SET NOMBRE_J = '{0}', ALIAS_J = '{1}', TIPO = '{2}', ESTADO = '{3}', PASSWORD = '{4}' WHERE JUGADOR_ID = {5}"
            cursor.execute(sql.format(jugador[0],jugador[1],jugador[2],jugador[3],jugador[4],id))
            self.conn.commit()
            print("OK")
        except Exception as err:
            print(err)
        