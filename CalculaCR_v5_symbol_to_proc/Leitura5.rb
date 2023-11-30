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
        mostrar_media_cr_cursos(@alunos, 1)
        mostrar_media_cr_cursos(@alunos, 2)
        
    end

# --------------------------------------------------------------------------------------------------------      
      # Método para mostrar a média de CR tanto dos alunos quando dos cursos. Só muda o parâmetro
      #Recebe como parâmetro o array @alunos que, por sua vez, importou do CSV
      def mostrar_media_cr_cursos(alunos, al_ou_curso)

        case al_ou_curso
        when 1
          coluna = :cod
        when 2
          coluna = :curso
        else
          puts "Parâmetro inválido"
        end

        #Imprime o Header do CR de cursos
        puts "----- Média de CR dos cursos ------"

        #faz uma nova iteração de alunos agrupando pela coluna de cursos
        alunos.group_by(&coluna).each do |codigo_curso, alunos_curso|

          
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