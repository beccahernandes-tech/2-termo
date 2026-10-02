const entrada = require("readline-sync");

const nivelOleo = entrada.questionFloat("Qual e o nivel de Oleo (%)? \n ");

let classificacao;

if (nivelOleo >= 40  && nivelOleo <= 80 ) {
    classificacao = "NIVEL NORMAL";
} else {
    classificacao = "INSPECAO NECESSARIA";
}
console.log( "=== NIVEL DA MAQUINA ===");
console.log(`Temperatura: ${nivelOleo}`);
console.log(`Classificacao: ${classificacao}`);