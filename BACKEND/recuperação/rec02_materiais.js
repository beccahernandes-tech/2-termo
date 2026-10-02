const entrada = require("readline-sync");

const nome = entrada.question("Qual e o nome da peca? \n" );
const quantidade = entrada.questionInt("Qual foi a quantidade comprada?\n ");
const preco = entrada.questionFloat("Qual e o preço unitario da peca? \n");

const total = quantidade * preco; 

console.log(`A peca comprada foi ${nome}, sendo comprada pelo preco unitario de ${preco}, como a quantidade levada foi de ${quantidade} unidades. O preco total da compra foi de: ${total}`); 
