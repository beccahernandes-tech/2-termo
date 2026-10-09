const fs = require('fs');

console.log("== SISTEMA DE REGISTROS DE MAQUINAS ==");

const maquinasIndustriais = [
    {id: 101, nome : "Torno Mecanico Universal", setor: "Usinagem", operacional: true},
    {id: 102, nome : "Fresadora Ferramenteira", setor: "Usinagem", operacional: false},
    {id: 103, nome : "Prensa Hidraulica 50T", setor: "Estamparia", operacional: true}
]
fs.writeFileSync('maquinas_industriais.json', JSON.stringify(maquinasIndustriais, null, 2))

console.log(`\Gravacao concluida com sucesso, verifique o arquivo gravado na pasta. `);