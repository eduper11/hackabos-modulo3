Familia /cliente
	id cliente
    apellido
    nombre
	dni
    cuenta
    direccion de facturacion
    tlf
miembros
	id miembro
    
    nombre
    apellidos
    tlf
    email
    
cliente-miembro
	id-cliente
	id miembro
	fecha alta
	fecha baja

cliente-paciente
	idcliente
    idpaciente
    fecha-baja

paciente (animal)
	id paciente
    nº chip
	alias
	razas
	especie
	pelo
    fecha nacimiento
    fallecimiento (null)
calendario vacunas

direccion
historial enfermedades
	idpaciente
	id_historia_enfermedades
    fecha alta
    descripcion diagnostico
    tratamiento
    id_enfermedad
enfermedades
	id enfermedad
    tipos enfermedad
    descripcion
historial peso
	idpaciente
    fecha
    peso
ingreso
	idingreso
    fecha
    idpaciente
    idmiembro
    tipo ingreso
tiposconsulta
	idtipoconsulta
    nombre (vacunacion, consulta, revision, intervencion)
vacunacion
	idVacunacion
    idvacuna
    fecha
    idpaciente
    dosis
    notas
vacunas
	idvacuna
    idespecie
    nombre
    dosis
Calendariovacunas
	idvacuna
    edad (meses)
    dosis