require_relative 'Leitura2'

class SomaAluno


    def initialize(leitura)
        @leitura = leitura
        @leitura.lerCsv(false)
    end


    def somar(codigo)
        soma_ct = 0

        @leitura.array_csv.each do |linha|

            if linha[0] == codigo
                puts "Debug: Adicionando #{linha[3]} à soma"
                soma_ct += linha[3]
            end
        end

        return soma
    end

end