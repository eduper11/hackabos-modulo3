

class Bank {
  constructor(name) {
    this.name = name;
    this.accounts = [];
    this.client = [];
    this.idAccount = 0;
    this.idClient = 0;
    this.accountId = 0;
    this.clientId = 0;
  }

  createClient() {
    const client = new Client(clientName);
    this.addClient(newClient);
    return newClient;
  }

  addClient(client) {
    if (this.client.indexOf(client) === -1) {
      this.client.push(client);
    }
  }

  createAccount(client, balance) {
    const newAccount = new Account(client, this, balance);
    this.addAccount(newAccount);
    client.addAccount(newAccount);
    return newAccount;
  }

  addAccount(account) {
    if (this.account.indexOf(account) === -1) {
      this.account.push(account);
    }
  }

  get newAccountId() {
    return ++this.accountId;
  }

  get newClientId() {
    return ++this.clientId;
  }

  accountPrototype (proto) {
      this.proto = proto;
      this.clone = function () {
          let account = new Account ();
          account.
      }
  }
}

class Client {
  constructor(name) {
    this.id = id;
    this.name = name;
    this.accounts = [];
  }
  addAccount(count) {
    if (this.accounts.indexOf(count) === -1) {
      this.accounts.push(count);
    }
  }
}

class Account {
  constructor(client, bank) {
    this.id = id;
    this.client = client;
    this.bank = bank;
    this.balance = 0;
  }
}

const bank1 = new Bank("001");
const clientPaco = bank1.createClient("Paco");
const initialBalancePacoAccount = 30;
const pacoAccount = bank1.createAccount(clientPaco, initialBalance);
const pacoAccount2 = bank1.createAccount(clientPaco, 60.5);

const clientIria = bank1.createClient("Iria");
const iriaAccount = bank1.createAccount(clientIria, 211.99)
