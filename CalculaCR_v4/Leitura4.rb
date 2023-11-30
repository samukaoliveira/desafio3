#Importa a classe CSV padrão
require 'csv'
require_relative 'Aluno'

#Declar a Classe
class Leitura

  # --------------------------------------------------------------------------------------------------------
#Inicializa o construtor utilizando @file como variável de instância.
    def initialize(file)
        @file = file
        @alunos = []
    end

# --------------------------------------------------------------------------------------------------------
#Cria o método para ler o arquivo CSV
    def lerCsv

#Inicia a leitura do CSV passando o nome do arquivo "@file" como parâmetro
#Este parâmetro é passo na instanciação de um novo objeto de da classe Leitura
        CSV.read(@file, headers: true).each do |row|

          #cria um array para cada coluna co CSV
            cod = row[0].to_i
            disciplina = row[1]
            curso = row[2].to_i
            nota = row[3].to_f
            carga = row[4].to_i
            turma = row[5].to_i
      
          #cia um array bidimensional para armazenar todo o CSV
          @alunos << Aluno.new(cod, disciplina, curso, nota, carga, turma)
        end
      
        #Chama o método de calcular o CR dos alunos passando como parâmetro o array com os dados do CSV
        calcular_CR_aluno(@alunos, 1)
        calcular_CR_aluno(@alunos, 2)
        
    end

# --------------------------------------------------------------------------------------------------------
      #Claclula de forma consolidada o CR geral de cada aluno somando todos os CRs de um mesmo aluno
      def calcular_CR_aluno(alunos, al_ou_curso)
        @display = ""

        #Declara um Hash
        cr_geral = {}
        
        #Inicia uma iteração no array @Alunos pra importar o codigo de cada um e somar as notas e cargas sem repetir
          @alunos.each do |aluno| 


            case al_ou_curso
            when 1
              coluna_cr = aluno.cod
              @display = "Alunos"
            when 2
              coluna_cr = aluno.curso
              @display = "Cursos"
            else
              puts "Parâmetro inválido"
            end

            #Cria uma variável pra armazenas as somas de todas as cargas horárias de um mesmo aluno
              carga_turma = soma_turma(@alunos, al_ou_curso, coluna_cr)

            #Inicializa os campus do Hash
              cr_geral[coluna_cr] ||= { soma_cr: 0, soma_cargas: 0}

            #Adiciona ao Hash a soma os valores das notas multiplicados pela carga horária horária
              cr_geral[coluna_cr][:soma_cr] += aluno.CalculaCr

              if (cr_geral[coluna_cr][:soma_cargas]) == 0
                cr_geral[coluna_cr][:soma_cargas] = carga_turma
              end
            
          
            #Chama o método de mostrar a média dos alunos
            
          end
        
        #Imprime o Header do resultado de saída
          puts "------- O CR dos #{@display} é: --------"
        #Inicia a iteração para mostrar linha a linda do Hsh
          cr_geral.each do |cod_al, valores|

            
        #Printa no terminal os códigos de cada aluno com seus respectivos CRs
        #A soma dos CRs é dividida peelo total de carga horária
            puts "#{cod_al}  -  #{"%02d" % (valores[:soma_cr] / valores[:soma_cargas]).to_i}" 
            
          end

        #Linha que delimita o fim dos CRs dos alunos
          puts "-----------------------------------"

        #Mostra os CRs dos cursos
         # mostrar_media_cr_cursos(alunos)

      end

# --------------------------------------------------------------------------------------------------------
      #Método que soma todas as cargas horárias de um mesmo aluno
      #Recebe como parâmetros o array @alunos e código do alun a ter as cargas horárias somadas
      def soma_turma(alunos, aluno_ou_curso, cod_aluno)

      #Declara a variável para somar as cargas horárias
        soma_turma = 0
        
      #Inicia a iteração das linhas onde o código do aluno é igual ao código passado por parâmetro
        @alunos.each do |aluno| 

          case aluno_ou_curso
          when 1
            coluna = aluno.cod
          when 2
            coluna = aluno.curso
          else
            puts "Parâmetro inválido"
          end


          if coluna == cod_aluno
            #Armazena as somas em uma variável
              soma_turma += aluno.carga
          end
        end
        #retorna o valor da soma
        return soma_turma.to_i

      end




end