const entrada = require(`readline-sync`);

const oficina = require(`./conversor`);

console.log("===== CONVERTEDOR DE DOLAR ======")

const dolar = entrada.questionInt("Digite aqui o valor em Dolar:" )

const valorconvertido = oficina.convertedorDolar(dolar);

console.log(`O valor convertido em reais é ${valorconvertido}`)