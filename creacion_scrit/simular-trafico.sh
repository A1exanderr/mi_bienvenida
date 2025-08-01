#!/bin/bash
echo "� Simulando tráfico alto durante 3 minutos..."

# Verifica si 'hey' está instalado
if ! command -v hey &> /dev/null; then
    echo "� Instalando 'hey' (herramienta de carga)..."
    go install github.com/rakyll/hey@latest
    export PATH=$PATH:~/go/bin
fi

# Lanza tráfico al servicio
echo "� Enviando tráfico a http://10.1.2.234:30080/"
hey -z 3m -c 100 -q 100 http://10.1.2.234:30080/

echo "✅ Prueba de carga finalizada."
