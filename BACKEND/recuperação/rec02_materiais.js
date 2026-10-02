const entrada = require("readline-sync");

const nome = entrada.question("Qual e o nome da peca?");
const quantidade = entrada.questionInt("Qual foi a quantidade comprada?");
const preco = entrada.questionFloat("Qual e o preço unitario da peca?");

const total = quantidade * preco; 

console.log(`A peca comprada foi ${nome}, sendo comprada pelo preco unitario de ${preco}, como a quantidade levada foi de ${quantidade} unidades. O preco total da compra foi de: ${total}`); 
