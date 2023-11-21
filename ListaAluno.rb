require_relative 'Leitura2'
require_relative 'SomaAluno'
require_relative 'Calcula'


class ListaAluno
    attr_reader :coluna1_distintos


    def initialize(leitura)
        @leitura = leitura
        @leitura.lerCsv
        gerar_lista_distintos
    end


    def gerar_lista_distintos

        @coluna1_distintos = @leitura.array_csv.map { |linha| linha[0] }.uniq 
    end


    


end