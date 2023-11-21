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
    def lerCsv

        #Verifica se o arquivo existe
        if File.exist?(@file)
            #Faz o loop de varredura separando as colunas de cada linha por vírgula
            CSV.foreach(@file) do |row|
            
               array_csv << row.map(&:to_i)

                puts row.join(', ')
            end
        else
            puts "Arquivo não encontrado."
        end
    end
 

    
    
    

 



end