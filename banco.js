class Cuenta {
  constructor(nombre, libroTransacciones, saldoInicial) {
    this.nombre = nombre;
    this.libroTransacciones = libroTransacciones;
    this._saldo = saldoInicial;
  }

  get saldo() {
    return this._saldo;
  }

  set saldo(value) {
    this._saldo = value;
  }

  get comision() {
    return 0.01;
  }

  crearTransaccion(destinatario, importe, referencia) {
    const valorTotalTransacciones = importe + this.comision;
    if (this.saldo < valorTotalTransacciones) {
      console.log(
        "No es posible realizar la transaccion, solo tienes " + this.saldo
      );
      return;
    }
    const transaccionReal = new Transaccion(
      this,
      destinatario,
      importe,
      referencia
    );
    const transaccionComision = new Transaccion(
      this,
      libroTransacciones.cuenta,
      this.comision,
      "Comision " + referencia
    );
    this.libroTransacciones.anadirTransaccion(transaccionReal);
    this.libroTransacciones.anadirTransaccion(transaccionComision);
    this.saldo = this.saldo - importe;
    destinatario.saldo = destinatario.saldo + importe;
    this.saldo = this.saldo - this.comision;
    libroTransacciones.cuenta.saldo += this.comision;
  }
}

class BussinessAccount extends Cuenta {
  constructor(nombre, libroTransacciones, saldoInicial) {
    super(nombre, libroTransacciones, saldoInicial);
  }

  get comision() {
    return 0.02;
  }
}

class Transaccion {
  constructor(emisor, receptor, cantidad, referencia) {
    this.emisor = emisor;
    this.receptor = receptor;
    this.cantidad = cantidad;
    this.referencia = referencia;
  }
}

class LibroTransacciones {
  constructor() {
    this.transacciones = [];
    this._cuenta = new Cuenta("Caja", this, 0);
  }

  get cuenta() {
    return this._cuenta;
  }

  anadirTransaccion(transaccion) {
    this.transacciones.push(transaccion);
  }

  abrirCuenta(tipo, nombre, saldoInicial) {
    if (tipo == 1) {
      // tipo 1;cuenta normal
      const nuevaCuenta = new Cuenta(nombre, this, saldoInicial);
      return nuevaCuenta;
    } else {
      //tipo2; cuenta bussiness
      const nuevaCuenta = new BussinessAccount(nombre, this, saldoInicial);
      return nuevaCuenta;
    }
  }
}

const libroTransacciones = new LibroTransacciones();
//const cuenta1 = new Cuenta("cuenta1", libroTransacciones);
//const cuenta2 = new Cuenta("cuenta2", libroTransacciones);
//const cuenta3 = new BusinessAccount(2,"cuenta3", libroTransacciones);
const cuenta1 = libroTransacciones.abrirCuenta(1, "cuenta1", 20); //otra forma
const cuenta2 = libroTransacciones.abrirCuenta(1, "cuenta2", 0);
const cuenta3 = libroTransacciones.abrirCuenta(2, "cuenta3", 0);

cuenta1.crearTransaccion(cuenta2, 30, "Primera transaccion");
