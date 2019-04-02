class Ship {
  constructor(damage, life, name) {
    this.damage = damage;
    this.life = life;
    this.name = name;
  }

  receiveDamage(damage) {
    this.life -= damage;
  }
}

class Ship1 extends Ship {
  constructor() {
    super(10, 5, "Death Star");
  }
}

class Ship2 extends Ship {
  constructor() {
    super(5, 10, "X-wing");
  }
}

class Ship3 extends Ship {
  constructor() {
    super(8, 7, "Millenium Falcom");
  }
}
// let ship1 = new Ship(10, 20, "nave1");
// ship1.receiveDamage(3);

class Army {
  constructor(name, numShip1, numShip2, numShip3) {
    this.name = name;
    this.shiplist = [];

    const shipgenerator = new Shipgenerator();
    const ships1 = shipgenerator.createShip(numShip1, 1);
    const ships2 = shipgenerator.createShip(numShip2, 2);
    const ships3 = shipgenerator.createShip(numShip3, 3);

    this.shiplist = [...ships1, ...ships2, ...ships3];
  }

  addShip(ship) {
    this.shiplist.push(ship);
  }
}

const army1 = new Army("ejer1", 4, 2, 7);

class Shipgenerator {
  constructor(name) {
    this.name = name;
  }

  createShip(quantity, type) {
    const list = [];

    for (let i = 0; i < quantity; i++) {
      if (type === 1) {
        list.push(new Ship1());
      } else if (type === 2) {
        list.push(new Ship2());
      } else if (type === 3) {
        list.push(new Ship3());
      } else {
        alert("Has introducido una tipo incorrecto");
      }
    }

    return list;
  }
}