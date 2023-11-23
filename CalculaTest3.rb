require_relative 'Leitura3'
require_relative 'Aluno'

#Esta classe testa os métodos de cálculo
class CalculaTest3

    #instancio um objeto de Leitura
    leitura = Leitura.new('notas.csv')
    leitura.lerCsv


end