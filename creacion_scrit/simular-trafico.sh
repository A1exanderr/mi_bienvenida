#!/bin/bash
echo "Ì¥• Simulando tr√°fico alto durante 3 minutos..."

# Verifica si 'hey' est√° instalado
if ! command -v hey &> /dev/null; then
    echo "Ì≥• Instalando 'hey' (herramienta de carga)..."
    go install github.com/rakyll/hey@latest
    export PATH=$PATH:~/go/bin
fi

# Lanza tr√°fico al servicio
echo "Ì∫Ä Enviando tr√°fico a http://10.1.2.234:30080/"
hey -z 3m -c 100 -q 100 http://10.1.2.234:30080/

echo "‚úÖ Prueba de carga finalizada."
