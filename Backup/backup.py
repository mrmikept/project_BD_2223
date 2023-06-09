import subprocess

host = 'localhost'
usuario = 'root'
senha = '1234'
nome_base_dados = 'belometrodb'
arquivo_backup = 'belometroBackup.sql'


def faz_backup(host, usuario, senha, nome_base_dados, arquivo_backup):

    comando_mysqldump = f'mysqldump --routines -h {host} -u {usuario} -p{senha} {nome_base_dados} > {arquivo_backup}'

    subprocess.run(comando_mysqldump, shell=True)

    print(f'O backup da base de dados {nome_base_dados} foi criado com sucesso em {arquivo_backup}.')

#def drop_base_dados(host, usuario, senha, nome_base_dados):

    #comando_drop = f'DROP DATABASE {nome_base_dados}'

    #subprocess.run(['mysql', '-h', host, '-u', usuario, '-p' + senha, '-e', comando_drop])

    #print(f'A base de dados {nome_base_dados} foi removida com sucesso.')


faz_backup(host, usuario, senha, nome_base_dados, arquivo_backup)
#drop_base_dados(host, usuario, senha, nome_base_dados)
