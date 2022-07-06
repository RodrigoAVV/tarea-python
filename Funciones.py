def listarJugadores(jugadores):
    contador=1
    for jug in jugadores:
        datos="{0}.ID: {1} | NOMBRE: {2} | ALIAS: {3} | TIPO: {4} | ESTADO: {5}"
        print(datos.format(contador,jug[0],jug[1],jug[2],jug[3],jug[4]))
        contador +=1
    print(" ")

def datosRegistro():
    nombre = input("Ingrese nombre ")
    alias = input("Ingrese alias ")
    tipo = input("Ingrese tipo ")
    estado = input("Ingrese estado ")
    personaje = (nombre,alias,tipo,estado)
    return personaje