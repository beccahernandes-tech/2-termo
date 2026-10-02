const entrada = require("readline-sync");

const producao = entrada.questionInt ("Quantos produtos sao produzidos por ciclo? \n");

for (let ciclo = 1; ciclo <= 12; ciclo++) {
    const total = producao * ciclo;
    console.log(`Ciclo ${ciclo}: ${total} pecas`);
}