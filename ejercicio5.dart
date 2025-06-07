// 5. Cree una clase CuentaBancaria que tenga las propiedades titular y saldo. Implemente métodos
// para:
// a. Depositar dinero.
// b. Retirar dinero (asegurándote de que el saldo no sea negativo).
// c. Consultar el saldo.

void main() {
  final cuentaAlvarez = CuentaBancaria(
    titular: "Carlos Alvarez",
    saldoInicial: 5,
  );

  print("El saldo disponible es de : ${cuentaAlvarez.saldo}");
  //Agregamos valores validos.
  //Se utilizo el setter y getter para agregar o consultar el saldo de la cuenta.
  print("Se han depositado 20 mil lempiras a la cuenta");
  cuentaAlvarez.depositar(20000);
  print("El saldo disponible es de : ${cuentaAlvarez.saldo}");
  print("Se retiran 19500 Lempiras de la cuenta.");
  cuentaAlvarez.retirarDinero(19500);
  print("El saldo disponible es de : ${cuentaAlvarez.saldo}");

  //Probando llevar a negativo el saldo
  print("Intentando retirar 510 lempiras de la cuenta.");
  try {
    cuentaAlvarez.retirarDinero(510);
  } catch (e) {
    print(e);
  }
  print("El saldo disponible es de : ${cuentaAlvarez.saldo}");
  print("Intentando ingresar un valor negativo en el deposito");
  try {
    cuentaAlvarez.depositar(-3030304);
  } catch (e) {
    print(e);
  }
}

//Clase CuentaBancaria.
class CuentaBancaria {
  final String titular;
  double _saldo = 0;

  CuentaBancaria({required this.titular, double saldoInicial = 0}) {
    this.saldo = saldoInicial;
  }
  //validar el saldo ingresado en el constrcuctor con un setter.
  set saldo(double saldo) {
    if (saldo < 0) {
      throw Exception("El saldo inicial no puede ser negativo.");
    }
    this._saldo = saldo;
  }

  //c. Consultar saldo
  double get saldo {
    return this._saldo;
  }

  //a. Depositar dinero.
  void depositar(double saldo) {
    if (saldo < 0) {
      throw Exception("El saldo a depositar no puede ser negativo.");
    }
    this._saldo += saldo;
  }

  //b. Retirar dinero
  void retirarDinero(double saldo) {
    if (this.saldo < saldo) {
      throw Exception("La cantidad a retirar de ${saldo} LPS excede su saldo.");
    }
    this._saldo -= saldo;
  }
}
