#vamos a crear los certificados primero crearmos ese archivo
nano csr.conf
/*
[req]
default_bits = 4096
prompt = no
default_md = sha256
req_extensions = req_ext
distinguished_name = dn

[dn]
CN = 1iticorp.com

[req_ext]
subjectAltName = @alt_names

[alt_names]
DNS.1 = 1iticorp.com
DNS.2 = *.1iticorp.com
DNS.3 = *.*.1iticorp.com
DNS.4 = *.*.*.1iticorp.com
*/
#generaremos laa clave para firmar el certificado
sudo openssl genrsa -out 1iticorp.key 4096
#generamos el siguiente archivo con el sigiente comando
sudo openssl req -new -key 1iticorp.key -out 1iticorp.csr -config csr.conf
#ahora firmamos el certificado con el tiempo de valides de un año
sudo openssl x509 -req -days 365 -in 1iticorp.csr -signkey 1iticorp.key -out 1iticorp.crt -extensions req_ext -extfile csr.conf



##comando para aplicar en linux
sudo mv 1iticorp.crt /usr/local/share/ca-certificates/1iticorp.crt
sudo update-ca-certificates
sudo reboot
##en windos abrimos porwe shel modo administrador
certutil -addstore -f "Root" "C:\Users\PC\Documents\1iticorp.crt"
