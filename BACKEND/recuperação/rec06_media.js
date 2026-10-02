const entrada = require("readline-sync");

let soma = 0;

for (let i = 1; i <= 6; i++) {
    const medias = entrada.questionFloat(`Digite a ${i} media: \n`);
    soma += medias;
}

const total = soma / 6;

console.log("\n -- MEDIA FINAL --");
console.log(`A soma das medias sao: ${soma}`);
console.log(`A media final foi de: ${total}`);