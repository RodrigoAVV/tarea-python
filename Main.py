from pydoc import doc
from turtle import clear
from Database import Database
import Funciones

def menu():
    print("=============== MENÚ PRINCIPAL ===============")
    print("0 Salir")
    print("1 Listar jugadores")
    print("2 Registrar jugador")
    print("3 Eliminar")
    print("4 Actualizar")
    print("=====================")
    opcion = int(input("Ingrese opción "))
    return opcion

def ejecutarOpcion():
    BD = Database()
    flag = True
    while(flag):
        opcion = menu()
        if opcion >= 0 and opcion <= 4 :
            if opcion == 0 :
                print("Gracias")
                flag = False
            elif opcion == 1 :
                jugadores = BD.ListJugadores()
                Funciones.listarJugadores(jugadores)
            elif opcion == 2 :
               jugadores = Funciones.datosRegistro()
               BD.registrarJugador(jugadores)
            elif opcion == 3 :
                jugadores = BD.ListJugadores()
                Funciones.listarJugadores(jugadores)
                id = input("Ingrese id del jugador a eliminar ")
                BD.eliminarJugador(id)
            elif opcion == 4 :
                jugadores = BD.ListJugadores()
                Funciones.listarJugadores(jugadores)
                id = input("Ingrese id del jugador para actualizar ")
                jugador = Funciones.datosRegistro()
                BD.actualizarJugador(jugador,id)
            
def validarIngreso():
    datos = Funciones.datosLogin()
    BD = Database()
    data = BD.login(datos)

    if data is None:
         print("Error")
    elif len(data) > 0 :
        ejecutarOpcion()

validarIngreso()



