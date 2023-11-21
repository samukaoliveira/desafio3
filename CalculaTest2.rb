require_relative 'Calcula'

#Esta classe testa os métodos de cálculo
class CalculaTest

    calcula_aluno1 = CalculaCrAlunos.new(9.5, 60, 350)
    resultado1 = calcula_aluno1.CalculaCrAlunos
    puts resultado1
end