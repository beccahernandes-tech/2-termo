const entrada = require(`readline-sync`);

const conta = entrada.questionInt("Qual é o valor do total da sua conta? \n");
const parcelas = entrada.questionInt("Quantas parcelas voce esta pagando? \n");

const valor = conta/parcelas

console.log(`O valor de cada parcela é: R$ ${valor.toFixed(2)}`);


for (let i = 0; i <= parcelas; i++) {
    console.log(`Parcela ${i}: R$ ${valor.toFixed(2)}`);

if (i === parcelas) {
    console.log("Parcelas adicionadas com sucesso!");

} else {
    
}

}