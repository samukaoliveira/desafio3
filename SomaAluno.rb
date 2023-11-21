require_relative 'Leitura2'

class SomaAluno


    def initialize(leitura)
        @leitura = leitura
        @leitura.lerCsv
    end


    def somar(codigo, coluna)
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