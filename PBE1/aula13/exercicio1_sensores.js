const fs = require('fs');

const sensores = [
    {codigo: 1001, tipo: "Temperatura", leituraAtual: 55.6, status: "Operando"},
    {codigo: 1002, tipo: "Pressao", leituraAtual: 6, status: "Operando"}, 
    {codigo: 1003, tipo: "Temperatura", leituraAtual: 255.9, status: "Alerta"},  
]
fs.writeFileSync('sensores.json', JSON.stringify(sensores,null,5));

console.log("Arquivo monitoramento criado com sucesso");