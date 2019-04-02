class Singleton2 {
  constructor() {
    this.instance = new Object();
  }
  createInstance() {
    var object = new Object("I am the instance");
    return Object;
  }
  getInstance() {
    if (!this.instance) {
      this.instance = createInstance();
    }
    return this.instance;
  }
}

var generador = new Singleton2();
var instance1 = generador.getInstance();
var instance2 = generador.getInstance();

var object2 = new Object();
