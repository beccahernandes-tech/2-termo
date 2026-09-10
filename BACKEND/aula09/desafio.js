const fs = require(`fs`);
const entrada = require(`readline-sync`);

console.log("===SISTEMA DE CONSULTA DE ESTOQUE===");

const produtos = [
    {id:1, nome: "Arroz", qtd: 10},
    {id:2, nome: "Macarrão", qtd: 200},
    {id:3, nome: "Feijão", qtd: 1200},
    {id:4, nome: "Chocolate", qtd: 10}
];

function dadosEstoque() {
    const dadosTexto = JSON.stringify(produtos, null, 2);

    fs.writeFileSync(`estoque.json`, dadosTexto);
    console.log("Dados salvos com sucesso no arquivo estoque.json!");
}

function verEstoque () {
    console.log("\n---Produto com estoque baixo (menos de 100) ---")

    const baixoEstoque = produtos.filter(p => p.qtd < 100);
    console.log(baixoEstoque);
}

dadosEstoque()
verEstoque()