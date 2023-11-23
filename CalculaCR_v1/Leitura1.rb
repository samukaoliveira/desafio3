#Importa a classe CSV padrão
require 'csv'

#Declar a Classe
class Leitura

#Inicializa o construtor utilizando @file como variável de instância.
    def initialize(file)
        @file = file
    end

#Cria o método para ler o arquivo CSV
    def lerCsv

        #Verifica se o arquivo existe
        if File.exist?(@file)
            #Faz o loop de varredura separando as colunas de cada linha por vírgula
            CSV.foreach(@file) do |row|
        
            puts row.join(', ')
            end
        else
            puts "Arquivo não encontrado."
        end
    end
 

    
    
    

 



end