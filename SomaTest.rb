require_relative 'Leitura2'
require_relative 'SomaAluno'

class SomaTest

    #instancio um objeto de Leitura
    leitura = Leitura.new('notas.csv')

    #instancio uma nova soma passando o objeto da nova leitura do array como parâmetro
    soma = SomaAluno.new(leitura)

    #inicializo uma variável de teste pra pegar o código 100
    cod = 100

    soma_notas = soma.somar(cod, 3)

    soma_carga = soma.somar(cod, 4)

    puts soma_notas

    puts soma_carga
end