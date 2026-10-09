const entrada = require(`readline-sync`);
const fs = require('fs');

const qtde = entrada.questionInt("Quantas ferramentas deseja cadastrar? \n");
const listaFerramentas = []

for (let i = 0; i < qtde; i++) {
    console.log(`\n Item ${i + 1} de ${qtde}:`);
    const nome = entrada.question("Nome da ferramenta: ");
    const quantidade = entrada.questionInt("Quantidade: ");
    const custoUnitario = entrada.questionFloat("Custo unitario (R$): ");

    listaFerramentas.push({
        nome: nome,
        quantidade: quantidade,
        custoUnitario: custoUnitario
    });
}

fs.writeFileSync('ferramentas.json', JSON.stringify(listaFerramentas, null, 2));

console.log("\n -----------------------------------")
console.log(`Sucesso: ${listaFerramentas.length} item gravados em 'ferramentas.json'.`);
console.log("---------------------------------------------");