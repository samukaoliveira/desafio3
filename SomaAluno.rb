require_relative 'Leitura2'

class SomaAluno


    def initialize(leitura)
        @leitura = leitura
        @leitura.lerCsv
    end


    def somar_notas(codigo)
        soma = 0

        @leitura.array_csv.each do |linha|

            if linha[0] == codigo
                puts "Debug: Adicionando #{linha[3]} à soma"
                soma += linha[3]
            end
        end

        return soma
    end

end