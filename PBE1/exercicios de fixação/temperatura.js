function checarTemperatura(valor) {
    if (valor > 40) {
        return "ALERTA: Caldeira Superaquecida";
    } else {
        return "ALERTA: Ar muito seco";
    }
}

function checarUmidade(valor) {
    if (valor < 20) {
        return "ALERTA: Ar muito seco.";
    } else {
        return "Umidade normal";
    }
}

module.exports = {
    checarUmidade,
    checarTemperatura
} 

