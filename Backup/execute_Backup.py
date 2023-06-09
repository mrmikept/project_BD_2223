import subprocess
import mysql.connector

config = {
    'host': 'localhost',
    'user': 'root',
    'password': '1234'
}

host = 'localhost'
usuario = 'root'
senha = '1234'
nome_base_dados = 'belometrodb'
arquivo_backup = 'belometroBackup.sql'



def execute_backup(host, usuario, senha, nome_base_dados, arquivo_backup):

    comando_mysql = f'mysql -h {host} -u {usuario} -p{senha} {nome_base_dados} < {arquivo_backup}'

    subprocess.run(comando_mysql, shell=True)

    print(f'O backup da base de dados {nome_base_dados} foi executado com sucesso em {arquivo_backup}.')


con = mysql.connector.connect(**config)

cursor = con.cursor()

cursor.execute(f"CREATE DATABASE {nome_base_dados}")

con.commit()

cursor.close()

con.close()

print(f"A Base de Dados '{nome_base_dados}' foi criado com sucesso!")

execute_backup(host, usuario, senha, nome_base_dados, arquivo_backup)