#Importa a classe CSV padrão
require 'csv'
require_relative 'Aluno'

#Declar a Classe
class Leitura


#Inicializa o construtor utilizando @file como variável de instância.
    def initialize(file)
        @file = file
        @alunos = []
    end

#Cria o método para ler o arquivo CSV
    def lerCsv
        @alunos = []

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
      
        # Debug do array alunos
        #puts "------- Alunos lidos do CSV --------"
        #alunos.each do |aluno|
        #puts "Matricula: #{aluno.cod}, Disciplina: #{aluno.disciplina}, Código do curso: #{aluno.curso}, Nota: #{aluno.nota}, Carga Horária: #{aluno.carga}"
        #end
        #puts "------------------------------------"
      
        #Chama o método de calcular o CR dos alunos passando como parâmetro o array com os dados do CSV
        calcular_e_mostrar_cr_geral(@alunos)
    end

    #**********Método de calcular os alunos - mostra todas as disciplinas de um aluno
   
      # def calcular_e_mostrar_cr(alunos)
      #   puts "------- O CR dos alunos é: --------"
      #   @alunos.each { |aluno| puts "#{aluno.cod}  -  #{aluno.CalculaCr / soma_turma(@alunos, aluno.cod)}" }
      #   puts "-----------------------------------"
      
      #   #Chama o método de mostrar a média dos alunos
      #   mostrar_media_cr_cursos(alunos)
      # end

      #Claclula de forma consolidada o CR geral de cada aluno somando todos os CRs de um mesmo aluno
      def calcular_e_mostrar_cr_geral(alunos)

        #Declara um Hash
        cr_geral = {}
        
        #Inicia uma iteração no array @Alunos pra importar o codigo de cada um e somar as notas e cargas sem repetir
          @alunos.group_by(&:cod).each do |cod_aluno, aluno| 

            #Cria uma variável pra armazenas as somas de todas as cargas horárias de um mesmo aluno
              carga_turma = aluno.sum(&:carga)

              #puts "Debug: #{carga_turma}"
              cr_aluno = (aluno.CalculaCr / carga_turma)

              soma_cr_aluno = cr_aluno.sum()
          
            #Chama o método de mostrar a média dos alunos
            
            #Printa no terminal os códigos de cada aluno com seus respectivos CRs
            #A soma dos CRs é dividida peelo total de carga horária
            puts "#{cod_aluno}  -  #{"%02d" % soma_cr_aluno}"
            
          end

        #Linha que delimita o fim dos CRs dos alunos
          puts "-----------------------------------"

        #Mostra os CRs dos cursos
          mostrar_media_cr_cursos(alunos)

      end


      #Método que soma todas as cargas horárias de um mesmo aluno
      #Recebe como parâmetros o array @alunos e código do alun a ter as cargas horárias somadas
      def soma_turma(alunos, cod_aluno)

      #Declara a variável para somar as cargas horárias
        soma_turma = 0
        
      #Inicia a iteração das linhas onde o código do aluno é igual ao código passado por parâmetro
        alunos.group_by(&:cod).each do |codigo_aluno, alunos_turma|
          
            #Armazena as somas em uma variável
              soma_turma += alunos_turma.sum(& :carga)
          
        end
        #retorna o valor da soma
        return soma_turma

      end

      
      # Método para mostrar a média de CR dos cursos
      #Recebe como parâmetro o array @alunos que, por sua vez, importou do CSV
      def mostrar_media_cr_cursos(alunos)

        #Imprime o Header do CR de cursos
        puts "----- Média de CR dos cursos ------"

        #faz uma nova iteração de alunos agrupando pela coluna de cursos
        alunos.group_by(&:curso).each do |codigo_curso, alunos_curso|
          #soma os CRs de cada aluno por curso, chamando o método CalculaCr para multiplicar cada elemento antes da soma
          total_cr_curso = alunos_curso.sum(&:CalculaCr) #Utilizando "symbol to proc" vai somar cada multiplicação de nota por carga horária

          #Soma a carga horária total de cada curso utilizando novamente "symbol to proc"...
          #pra especificar que a soma é de todas as cargas horárias que forem referentes a um curso
          total_carga_horaria_curso = alunos_curso.sum(&:carga)

          #Variável que recebe a divisão do CR total do curso pela Carga Horária Total
          media_cr_curso = total_cr_curso / total_carga_horaria_curso

          #Imprime o código de cada curso com seu respectivo CR geral, utlizando formatação especial para fazer o alinhamento na tela
          puts "#{"%03d" % codigo_curso}  -  #{media_cr_curso.to_i}"
        end
        puts "-----------------------------------"
      end
 


end