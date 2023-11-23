require_relative 'Leitura4'
require_relative 'Aluno'

#Esta classe testa os métodos de cálculo
class CalculaTest4

    #instancio um objeto de Leitura
    leitura = Leitura.new('notas.csv')
    leitura.lerCsv


end