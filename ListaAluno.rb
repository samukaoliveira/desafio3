require_relative 'Leitura2'
require_relative 'SomaAluno'
require_relative 'Calcula'


class ListaAluno
    attr_reader :coluna1_distintos


    def initialize(leitura)
        @leitura = leitura
        @leitura.lerCsv
        codigo_alunos
    end


    def codigo_alunos

        @coluna1_distintos = @leitura.array_csv.map { |linha| linha[0] }.uniq 

        #puts @coluna1_distintos
    end


    


end