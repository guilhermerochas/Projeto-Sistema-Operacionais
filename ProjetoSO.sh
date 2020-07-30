#!/bin/bash
#Projeto de Sistemas de Informação
#Materia: Sistemas Operacionais
#Guilherme Sacramento Rocha

Renomear()
{
    echo "Digite o nome do arquivo: "
    read arquivo
    if [ -e "$arquivo" ] && [ -n "$arquivo" ]
    then
        echo "Digite o novo nome: "
        read novo_nome
        if [ -n "$novo_nome" ]
        then
            mv $arquivo $novo_nome
            echo "arquivo renomeado..."
        else
            echo "Por favor digite um nome para o arquivo"
        fi;
    else
        echo "O arquivo nao existe ou falta parametros"
    fi;
}

Copiar()
{
    echo "Digite o nome do arquivo: "
    read arquivo
    if [ -e "$arquivo" ] && [ -n "$arquivo" ]
    then
        echo "Digite o nome do arquivo copia: "
        read copia
        if [ -n "$copia" ]
        then
            cp $arquivo $copia
            echo "arquivo copiado..."
        else
            echo "Por favor digite um nome para o arquivo"
        fi;
    else
        echo "O arquivo nao existe ou falta parametros"
    fi;
}

Excluir()
{
    echo "Digite o arquivo que deseja excluir: "
    read remover
    if [ -e "$remover" ] && [ -n "$remover" ]
    then
        rm -f $remover
        echo "arquivo removido!"
    else
        echo "o arquivo nao existe ou falta parametros"
    fi;
}

CopiaArquivos()
{
    echo "Digite o arquivo a ser copiado: "
    read copiado
    if [ -f /root/"$copiado" ] && [ -n "$copiado" ]
    then
        echo "Digite um diretorio: "
        read dir
        if [ -n "$dir" ] && [ -d "$dir" ]
        then
            cp /root/$copiado $dir
        else
            echo "O diretorio nao existe ou faltam argumentos"
        fi;
    else
        echo "O diretorio nao existe ou faltam argumentos"
    fi;
}

Sair()
{
    date && whoami && pwd
    date > relat.txt
    whoami >> relat.txt
    pwd >> relat.txt
    exit
}

if [ "$#" -ne 0 ]
then
    echo "Foram passados parametros!"
else
    echo "Selecione a opcao: "
    select op in Renomear Copiar Excluir "Copiar Arquivos" Sair
    do
        case "$op" in
        'Renomear')
            Renomear;
            ;;
        'Copiar')
            Copiar;
            ;;
        'Excluir')
            Excluir;
            ;;
        'Copiar Arquivos')
            CopiaArquivos;
            ;;
        'Sair')
            Sair;
            ;;
        *)
            echo "Digite uma opcao valida"
            ;;
        esac;
    done;
fi;
