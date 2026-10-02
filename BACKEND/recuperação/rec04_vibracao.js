const entrada = require("readline-sync");

const vibracao = entrada.questionFloat("Qual e o valor da vibracao? \n");

let classificacao;

if (vibracao <= 3 ) {
    classificacao = "ESTAVEL";
} else if (vibracao >= 3 && vibracao <= 6 ){
    classificacao = "ATENCAO";
} else {
    classificacao = "CRITICA";
} 

console.log("==VIBRACAO DA MAQUINA==");
console.log(`Vibracao da maquina: ${vibracao}`);
console.log(`classificacao: ${classificacao}`);