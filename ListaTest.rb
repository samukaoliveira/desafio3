require_relative 'Calcula'
require_relative 'SomaAluno'
require_relative 'Leitura2'
require_relative 'ListaAluno'
require_relative 'ListaTurma'


#Esta classe testa os métodos de cálculo
class ListaTest

    #instancio um objeto de Leitura
    @leitura3 = Leitura.new('notas.csv')

    #instancio uma nova soma passando o objeto da nova leitura do array como parâmetro
    @soma = SomaAluno.new(@leitura3)

    #inicializo uma variável de teste pra pegar o código 100
    #cod = 100

    #crio uma variável pra armazenar o resultado da soma, passndo o cod do aluno 110 como parâmetro
    #soma_notas = soma.somar(cod, 3)
    #soma_carga = soma.somar(cod, 4)

    #puts soma_notas

    #instancio um novo cálculo de aluno passando a soma do aluno 110 como parâmetro


    # @lista = ListaAluno.new(@leitura)
    # puts lista.codigo_turmas


    @lista_turma = ListaTurma.new(@leitura3)

    puts @lista_turma.codigo_turmas

    # @lista_turma = ListaTurma.new(@leitura)

    # @lista_turma.turmas_distintas.each do |cod|
    #     puts cod

    
end