const entrada = require(`readline-sync`);

const nome = entrada.question("Difite aqui seu nome: \n ");
const idade = entrada.questionInt("Quantos anos voce tem? \n ");
const horario = entrada.questionFloat("Qual e o tempo de contribuicao no trabalho? \n ");

if (idade >= 65 || horario >= 30 ) {
    console.log("Sua aposentadoria está liberada!")
} else {
    console.log("Sua aposentadoria está negada!")
}