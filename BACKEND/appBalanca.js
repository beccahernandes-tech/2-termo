const entrada = require('readline-sync');
const { verificarPeso } = require('./funcoes'); 

while (true) {


    try {
        const leitura = entrada.question("Digite o peso da peca (ou 'sair'): \n");

    
        if (leitura.toLowerCase() === 'sair') {
            console.log("Sistema da balança encerrado.");
            break; 
        }

        const resultado = verificarPeso(leitura);
        console.log(resultado);

    } catch (erro) {
        console.error(`⚠️ ALERTA: ${erro.message}`);
    }
}
