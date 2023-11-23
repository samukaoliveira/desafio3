require_relative 'Calcula'
require_relative 'SomaAluno'
require_relative 'Leitura2'
require_relative 'ListaAluno'
require_relative 'MediaAluno'

#Esta classe testa os métodos de cálculo
class CalculaTest

    #instancio um objeto de Leitura
    @leitura = Leitura.new('notas.csv')

    #instancio uma nova soma passando o objeto da nova leitura do array como parâmetro
    @soma = SomaAluno.new(@leitura)

    #inicializo uma variável de teste pra pegar o código 100
    #cod = 100

    #crio uma variável pra armazenar o resultado da soma, passndo o cod do aluno 110 como parâmetro
    #soma_notas = soma.somar(cod, 3)
    #soma_carga = soma.somar(cod, 4)

    #puts soma_notas

    #instancio um novo cálculo de aluno passando a soma do aluno 110 como parâmetro


    @lista = ListaAluno.new(@leitura)
    

    @lista.coluna1_distintos.each do |cod|

        if cod > 0
            @leitura.lerCsv(true)

            soma_notas = @soma.somar(cod, 3)
            soma_carga = @soma.somar(cod, 4)

            #puts "Debug: cod = #{cod}, soma_carga = #{soma_carga}"
            #puts "Debug: soma_carga = #{soma_carga}"

            @media = Calcula.new(cod, soma_notas, 60, soma_carga)
    

            puts @media.CalculaCrAlunos
            #puts soma_carga
            # puts soma_notas
        end
    end


end