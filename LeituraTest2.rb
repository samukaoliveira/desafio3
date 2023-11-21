require_relative 'Leitura2'

#Esta classe testa apenas a leitura
class LeituraTest

    #Instancia um novo objeto da classe 'Leitura'
    leitura1 = Leitura.new('notas.csv')
    #Chama o método 'lerCsv'
    leitura1.lerCsv
    

end