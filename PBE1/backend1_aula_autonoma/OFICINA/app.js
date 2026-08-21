const entrada = require(`readline-sync`);

// Importar o modulo funcoesOficina 
const oficina = require(`./funcoesOficina`);

console.log("=== SISTEMA DE GESTAO DE OFICINA ===");

const peca = entrada.questionFloat("Preco da peca: R$ ");
const horas = entrada.questionInt("Horas de servico: ");
const tempoUso = entrada.questionInt("Meses desde o ultimo conserto: ");


const statusGarantia = oficina.verificarGarantia(tempoUso);
const total = oficina.calcularOrcamento(peca, horas);
const totalComDesconto = oficina.comDesconto(total);

//Relatorio Final
console.log("\n--- RELATORIO DE SERVICO ---");
console.log(`Orcamento: R$ ${total.toFixed(2)}`);
console.log(`Orcamento com desconto (5%): R$ ${totalComDesconto.toFixed(2)}`);
console.log(`Status da Garantia ${statusGarantia}`);
console.log("🚗".repeat(15));