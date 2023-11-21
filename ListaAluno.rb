require_relative 'Leitura2'
require_relative 'SomaAluno'
require_relative 'Calcula'


class ListaAluno


    def initialize(leitura)
        @leitura = leitura
        @leitura.lerCsv
    end


    def somar
        soma = 0

        @leitura.array_csv.each do |linha|

            if linha[0] == codigo
                puts "Debug: Adicionando #{linha[coluna]} à soma"
                soma += linha[coluna]
            end
        end

        return soma
    end


end