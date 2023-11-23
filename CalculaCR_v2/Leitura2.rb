#Importa a classe CSV padrão
require 'csv'

#Declar a Classe
class Leitura

    attr_accessor :array_csv

#Inicializa o construtor utilizando @file como variável de instância.
    def initialize(file)
        @file = file
        @array_csv = []
    end

#Cria o método para ler o arquivo CSV
    def lerCsv(row_map)

        #Verifica se o arquivo existe
        if File.exist?(@file)
            #Faz o loop de varredura separando as colunas de cada linha por vírgula
            CSV.foreach(@file) do |row|
                
                if row_map == true
                    array_csv << row.map(&:to_i)
                else
                    array_csv << row
                end

                #puts row.join(', ')
            end
        else
            puts "Arquivo não encontrado."
        end
    end
 

    
    
    

 



end