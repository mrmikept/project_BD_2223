import mysql.connector
import csv
import codecs

config = {
    'host': 'localhost',
    'user': 'root',
    'password': '1234',
    'database': 'belometrodb',
    'charset': 'utf8mb4'
}

conn = mysql.connector.connect(**config)

mycursor = conn.cursor()

with codecs.open('Estações.csv', 'r', encoding='utf-8') as csv_file:
    csvfile = csv.reader(csv_file, delimiter=',')
    next(csvfile)
    all_values = []
    for row in csvfile:
        value = (row[0], row[1], row[2], row[3], row[4])
        all_values.append(value)

query = "insert into estação (`Nome`, `Longitude`, `Latitude`, `PontosInteresse`, `Descrição`) values (%s,%s,%s,%s,%s)"
mycursor.executemany(query, all_values)
conn.commit()

with codecs.open('Clientes.csv', 'r', encoding='utf-8') as csv_file:
    csvfile = csv.reader(csv_file, delimiter=',')
    next(csvfile)
    all_values = []
    for row in csvfile:
        value = (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7])
        all_values.append(value)

query = "insert into cliente (`Contribuinte`, `Nome`, `DataNascimento`, `Genero`, `Rua`, `Localidade`, `CodigoPostal`, `email`) values (%s,%s,%s,%s,%s,%s,%s,%s)"
mycursor.executemany(query, all_values)
conn.commit()

with codecs.open('ContactosClientes.csv', 'r', encoding='utf-8') as csv_file:
    csvfile = csv.reader(csv_file, delimiter=',')
    next(csvfile)
    all_values = []
    for row in csvfile:
        value = (row[0], row[1])
        all_values.append(value)

query = "insert into clientecontactos (`Cliente`, `Contacto`) values (%s,%s)"
mycursor.executemany(query, all_values)
conn.commit()


with codecs.open('Funcionarios.csv', 'r', encoding='utf-8') as csv_file:
    csvfile = csv.reader(csv_file, delimiter=',')
    next(csvfile)
    all_values = []
    for row in csvfile:
        value = (row[0], row[1], row[2], row[3], row[4], row[5], row[6], row[7], row[8], row[9], row[10], row[11])
        all_values.append(value)

query = "insert into funcionario (`Contribuinte`, `Nome`, `DataNascimento`, `Genero`, `Cargo`, `Salario`, `IBAN`, `Rua`, `Localidade`, `CodigoPostal`, `email`, `Estação`) values (%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
mycursor.executemany(query, all_values)
conn.commit()


with codecs.open('ContactosFuncionarios.csv', 'r', encoding='utf-8') as csv_file:
    csvfile = csv.reader(csv_file, delimiter=',')
    next(csvfile)
    all_values = []
    for row in csvfile:
        value = (row[0], row[1])
        all_values.append(value)

query = "insert into funcionariocontactos (`Funcionario`, `Contacto`) values (%s,%s)"
mycursor.executemany(query, all_values)
conn.commit()


with codecs.open('Veiculos.csv', 'r', encoding='utf-8') as csv_file:
    csvfile = csv.reader(csv_file, delimiter=',')
    next(csvfile)
    all_values = []
    for row in csvfile:
        value = (row[0], row[1], row[2])
        all_values.append(value)

query = "insert into veiculo (`IdVeiculo`, `NrCarruagens`, `NrLugares`) values (%s,%s,%s)"
mycursor.executemany(query, all_values)
conn.commit()


with codecs.open('Bilhetes.csv', 'r', encoding='utf-8') as csv_file:
    csvfile = csv.reader(csv_file, delimiter=',')
    next(csvfile)
    all_values = []
    for row in csvfile:
        value = (row[0], row[1], row[2], row[3], row[4], row[5], row[6])
        all_values.append(value)

query = "insert into bilhete (`FormaPagamento`, `Tipo`, `DataVenda`, `DataValidade`, `Preço`, `Funcionario`, `Cliente`) values (%s,%s,%s,%s,%s,%s,%s)"
mycursor.executemany(query, all_values)
conn.commit()


with codecs.open('Viagens.csv', 'r', encoding='utf-8') as csv_file:
    csvfile = csv.reader(csv_file, delimiter=',')
    next(csvfile)
    all_values = []
    for row in csvfile:
        value = (row[0], row[1], row[2], row[3])
        all_values.append(value)

query = "insert into viagem (`Data`, `Bilhete`, `Origem`, `Destino`) values (%s,%s,%s,%s)"
mycursor.executemany(query, all_values)
conn.commit()


with codecs.open('ViagemVeiculo.csv', 'r', encoding='utf-8') as csv_file:
    csvfile = csv.reader(csv_file, delimiter=',')
    next(csvfile)
    all_values = []
    for row in csvfile:
        value = (row[0], row[1])
        all_values.append(value)

query = "insert into viagemveiculo (`Viagem`, `Veiculo`) values (%s,%s)"
mycursor.executemany(query, all_values)
conn.commit()


with codecs.open('FuncionariosVeiculos.csv', 'r', encoding='utf-8') as csv_file:
    csvfile = csv.reader(csv_file, delimiter=',')
    next(csvfile)
    all_values = []
    for row in csvfile:
        value = (row[0], row[1], row[2], row[3])
        all_values.append(value)

query = "insert into funcionarioveiculo (`Funcionario`, `Veiculo`, `Data`, `Observações`) values (%s,%s,%s,%s)"
mycursor.executemany(query, all_values)
conn.commit()


with codecs.open('EstaçõesVeículos.csv', 'r', encoding='utf-8') as csv_file:
    csvfile = csv.reader(csv_file, delimiter=',')
    next(csvfile)
    all_values = []
    for row in csvfile:
        value = (row[0], row[1], row[2])
        all_values.append(value)

query = "insert into estaçãoveiculo (`Hora`, `Veiculo`, `Estação`) values (%s,%s,%s)"
mycursor.executemany(query, all_values)
conn.commit()
conn.close()