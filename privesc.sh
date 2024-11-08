#!/bin/bash

print_header() {
    echo -e "\n[*] $1\n"
}

print_separator() {
    echo -e "-------------------------------------------------------------\n"
}

check_command() {
    command -v "$1" >/dev/null 2>&1 || { echo >&2 "$1 não está instalado. Abortando..."; exit 1; }
}

run_with_sudo() {
    if [ "$(id -u)" != "0" ]; then
        sudo "$@"
    else
        "$@"
    fi
}

check_command "curl"
check_command "grep"

print_header "PrivEsc - Desenvolvido por Israel"
print_separator

echo "[*] Iniciando Enumeração..."
print_separator

echo "[*] Informações Gerais do Sistema:"
run_with_sudo lsb_release -a
uname -a
hostnamectl
uptime

print_separator

echo "[*] Informações de Rede:"
run_with_sudo ifconfig -a
run_with_sudo netstat -antup
run_with_sudo ss -ltnp

print_separator

echo "[*] Processos em Execução:"
run_with_sudo ps aux

print_separator

echo "[*] Verificando Permissões:"
ls -al /etc/passwd /etc/group /etc/hosts /etc/hostname /etc/sudoers

print_separator

echo "[*] Procurando por Binários Suid:"
run_with_sudo find / -perm -4000 -type f -exec ls -ld {} \; 2>/dev/null

print_separator

echo "[*] Verificando Arquivos e Diretórios com Permissões Graváveis:"
run_with_sudo find / -writable -type d 2>/dev/null | grep -v "Permission denied"
run_with_sudo find / -perm -2 -type f 2>/dev/null | grep -v "Permission denied"

print_separator

echo "[*] Verificando Binários com Permissões Graváveis:"
run_with_sudo find / -perm -o w -type f 2>/dev/null | grep -v "Permission denied"

print_separator

echo "[*] Verificando Versão do Kernel:"
uname -r

print_separator

echo "[*] Informações de Usuários:"
run_with_sudo cat /etc/passwd
run_with_sudo cat /etc/sudoers

print_separator

echo "[*] Crontabs:"
run_with_sudo cat /etc/crontab
run_with_sudo ls -al /etc/cron*

print_separator

echo "[*] Arquivos Configurados no Apache:"
run_with_sudo ls -al /etc/apache2
run_with_sudo ls -al /etc/apache2/sites-enabled

print_separator

echo "[*] Arquivos Configurados no MySQL:"
run_with_sudo ls -al /etc/mysql
run_with_sudo ls -al /etc/mysql/my.cnf

print_separator

echo "[*] Arquivos Configurados no NFS:"
run_with_sudo cat /etc/exports

print_separator

echo "[*] Arquivos de Log Suspeitos:"
run_with_sudo ls -al /var/log/*.log
run_with_sudo ls -al /var/log/apache2/*.log
run_with_sudo ls -al /var/log/mysql/*.log
run_with_sudo ls -al /var/log/nginx/*.log

print_separator

echo "[*] Arquivos de Configuração no /var/www:"
run_with_sudo ls -al /var/www/*

print_separator

echo "[*] Finalizando Enumeração..."
print_separator

echo "[*] Enumeração Concluída. Verifique os resultados acima."
print_separator
