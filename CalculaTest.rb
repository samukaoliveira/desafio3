require_relative 'Calcula'

#Esta classe testa os métodos de cálculo
class CalculaTest

    #instancio um objeto de Leitura
    leitura = Leitura.new('notas.csv')

    #instancio uma nova soma passando o objeto da nova leitura do array como parâmetro
    soma = SomaAluno.new(leitura)

    #inicializo uma variável de teste pra pegar o código 100
    cod = 110

    #crio uma variável pra armazenar o resultado da soma, passndo o cod do aluno 110 como parâmetro
    soma_notas = soma.somar_notas(cod)

    #puts soma_notas

    #instancio um novo cálculo de aluno passando a soma do aluno 110 como parâmetro
    calcula_aluno1 = CalculaCrAlunos.new(soma_notas, 60, 350)
    resultado1 = calcula_aluno1.CalculaCrAlunos
    puts resultado1
end