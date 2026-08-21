const entrada = require(`readline-sync`);

function calcularArea (n1, n2){
    return n1 * n2 
}

const largura = entrada.questionInt("Qual e a largura do primeiro terreno? \n");
const comprimento = entrada.questionInt("Qual e o comprimento do primeiro terreno? \n ")

const largura2 = entrada.questionInt("Qual e a largura do segundo terreno? \n");
const comprimento2 = entrada.questionInt("Qual e o comprimento do segundo terreno? \n ")

const largura3 = entrada.questionInt("Qual e a largura do terceiro terreno? \n");
const comprimento3 = entrada.questionInt("Qual e o comprimento do terceiro terreno? \n ")

const area = largura * comprimento
console.log(`A primeira area é ${calcularArea(largura,comprimento)}`);
console.log(`A segunda area é ${calcularArea(largura2,comprimento2)}`);
console.log(`A terceira area é ${calcularArea(largura3,comprimento3)}`);