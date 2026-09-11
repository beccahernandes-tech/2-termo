const entrada = require(`readline-sync`);
const temp = require(`./temperatura`);


const temperatura = entrada.questionFloat = ("Qual é a primeira temperatura? ");
const umidade = entrada.questionFloat = ("Qual é a segunda temperatura? ");

console.log(temp.checarUmidade(umidade));
console.log(temp.checarTemperatura(temperatura));
