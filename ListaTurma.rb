require_relative 'Leitura2'
require_relative 'SomaAluno'
require_relative 'Calcula'


class ListaTurma
    attr_reader :turmas_distintas


    def initialize(leitura)
        @leitura = leitura
        @leitura.lerCsv
        codigo_turmas
    end


    def codigo_turmas

        @turmas_distintas = @leitura.array_csv.map { |linha| linha[1] }.uniq 

        puts @turmas_distintas
    end


    


end