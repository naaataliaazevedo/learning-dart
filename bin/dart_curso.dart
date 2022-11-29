void main(List<String> arguments) {
  String nome = 'Laranja';
  double peso = 100.2;
  String corFruta = "verde e amarela";
  String sabor = "doce e cítrica";
  int diasDesdeColheita = 20;
  bool isMadura = funcEstaMadura(diasDesdeColheita);

  Legumes mandioca = Legumes('Mandioca', 1200, 'Marrom', true);
  Fruta banana = Fruta('Banana', 1, 'Amarela', 'Doce', 12);
  FrutasSecas nozes = FrutasSecas('Macadamia', 2, 'Branca', 'Doce', 20, 35);
  Citricas limao = Citricas('Limão', 100, 'Verde', 'Azedo', 5, 9);

  mandioca.printAlimento();
  banana.printAlimento();
  nozes.printAlimento();
  limao.printAlimento();
}

class Alimento {
  String nome;
  double peso;
  String cor;

  Alimento(this.nome, this.peso, this.cor);

  void printAlimento() {
    print('Este $nome pesa $peso gramas e é $cor');
  }
}

class Fruta extends Alimento implements Bolo {
  String sabor;
  int diasDesdeColheita;
  bool? isMadura; // true false ou null

  //construtor
  Fruta(
      String nome, double peso, String cor, this.sabor, this.diasDesdeColheita,
      {this.isMadura})
      : super(nome, peso, cor);

  estaMadura(int diasParaMadura) {
    isMadura = diasDesdeColheita >= diasParaMadura;
    print(
        "A sua $nome foi colhida a $diasDesdeColheita dias, e precisa de $diasParaMadura para poder comer. Ela está madura? $isMadura");
  }

  void fazerSuco() {
    print('Você fez um suco de $nome');
  }

  @override
  void separarIngredientes() {
    print('Catar a $nome');
  }

  @override
  void fazerMassa() {
    print('Misturar a fruta com farinha, acucar e ovos');
  }

  @override
  void assar() {
    print('Colocar no forno');
  }
}

class Legumes extends Alimento implements Bolo {
  bool isPrecisaCozinhar;

  Legumes(String nome, double peso, String cor, this.isPrecisaCozinhar)
      : super(nome, peso, cor);

  void cozinhar() {
    if (isPrecisaCozinhar) {
      print('Pronto, o $nome está cozinhando');
    } else {
      print('O $nome não precisa cozinhar');
    }
  }

  @override
  void separarIngredientes() {}

  @override
  void fazerMassa() {}

  @override
  void assar() {}
}

class Citricas extends Fruta {
  double nivelAzedo;

  Citricas(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.nivelAzedo)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  void existeRefri(bool existe) {
    if (existe) {
      print('Existe refrigerante de $nome');
    } else {
      print('Não existe refrigerante de $nome');
    }
  }
}

class FrutasSecas extends Fruta {
  double porcentagemOleoNatural;

  FrutasSecas(String nome, double peso, String cor, String sabor,
      int diasDesdeColheita, this.porcentagemOleoNatural)
      : super(nome, peso, cor, sabor, diasDesdeColheita);

  @override
  void fazerMassa() {
    print('Tirar a casta da $nome');
    super.fazerMassa();
  }
}

abstract class Bolo {
  void separarIngredientes();
  void fazerMassa();
  void assar();
}

funcQuantosDiasMadura(int dias) {
  int diasParaMadura = 30;
  int quantosDiasFaltam = diasParaMadura - dias;
  return quantosDiasFaltam;
}

mostrarMadura(String nome, int dias, {required String cor}) {
  if (dias >= 30) {
    print('A $nome está madura');
  } else {
    print('A $nome não está madura');
  }

  if (cor != null) {
    print('A $nome é $cor');
  }
}

bool funcEstaMadura(int dias) {
  if (dias >= 30) {
    return true;
  } else {
    return false;
  }
}
