const entrada = require('readline-sync');

function  verificarPeso(leitura) {
    const peso = Number(leitura)
    if (peso(isNaN)) {
        throw new Error("Entrada inválida! Digite apenas números.")
    } if (peso <100 && peso > 500) {
        throw new Error("Peso fora do padrão (100g - 500g)! Peça descartada.")
    } else {
        return (`Peça aprovada com ${peso}`)
    }
        
}

module.exports = {
    verificarPeso
}