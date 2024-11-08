## PrivEsc
PrivEsc é uma ferramenta de enumeração de informações sobre o sistema, desenvolvida para facilitar a análise de vulnerabilidades e identificar possíveis vetores de Escalação de Privilégios (Privilege Escalation). O script foi projetado para ambientes Linux, realizando a coleta de dados críticos sobre o sistema, rede, permissões de arquivos e processos.

- Funcionalidades
- Informações Gerais: Coleta detalhes sobre o sistema operacional, kernel, hostname e uptime.
- Configurações de Rede: Exibe informações das interfaces de rede, conexões e portas abertas.
- Processos e Permissões: Lista processos em execução e verifica permissões de arquivos sensíveis como /etc/passwd e /etc/sudoers.
- Binários SUID: Identifica binários com a permissão SUID, que podem permitir execução com privilégios elevados.
- Diretórios e Arquivos Graváveis: Busca arquivos e diretórios graváveis, verificando possíveis locais de escrita não autorizada.
- Configurações de Serviços: Realiza verificações de arquivos de configuração de serviços populares como Apache, MySQL e NFS.
- Logs Sensíveis: Enumera logs do sistema e de serviços para identificar eventos de segurança.

# Baixar e executar
```bash
git clone https://github.com/Israelicon/PrivEsc.git
cd PrivEsc
chmod +x privesc.sh
./privesc.sh
```

ou 

```bash
wget https://raw.githubusercontent.com/Israelicon/PrivEsc/refs/heads/main/privesc.sh
bash privesc.sh
```
![bandicam 2024-11-07 22-18-50-226](https://github.com/user-attachments/assets/dde190ae-4a80-49f0-8ac4-6272ed64e6ad)
