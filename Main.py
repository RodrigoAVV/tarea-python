from pydoc import doc
from turtle import clear
from Database import Database
import Funciones

def menu():
    print("=============== MENÚ PRINCIPAL ===============")
    print("0 Salir")
    print("1 Listar jugadores")
    print("2 Registrar jugador")
    print("3 Editar")
    print("=====================")
    opcion = int(input("Ingrese opción "))
    return opcion

def ejecutarOpcion():
    BD = Database()
    flag = True
    while(flag):
        opcion = menu()
        if(opcion >= 0 and opcion <= 2):
            if(opcion == 0):
                print("Gracias")
                flag = False
            elif(opcion == 1):
                jugadores = BD.ListJugadores()
                Funciones.listarJugadores(jugadores)
            elif(opcion == 2):
               jugadores = Funciones.datosRegistro()
               BD.registrarJugador(jugadores)
            elif(opcion == 3):
                print("Opción 3")
            
ejecutarOpcion()
