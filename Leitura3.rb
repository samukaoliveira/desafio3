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

    #Método de calcular os alunos utilizando o array e o método de "pré-calculo" da classe Aluno
    def calcular_e_mostrar_cr(alunos)
        puts "------- O CR dos alunos é: --------"
        @alunos.each { |aluno| puts "#{aluno.cod}  -  #{aluno.CalculaCr}" }
        puts "-----------------------------------"
      
        #Chama o método de mostrar a média dos alunos
        mostrar_media_cr_cursos(@alunos)
        
    end



      def calcular_e_mostrar_cr2(alunos)
        puts "------- O CR dos alunos é: --------"
        @alunos.each { |aluno| puts "#{aluno.cod}  -  #{aluno.CalculaCr / soma_turma(@alunos, aluno.cod)}" }
        puts "-----------------------------------"
      
        #Chama o método de mostrar a média dos alunos
        mostrar_media_cr_cursos(alunos)
      end


      def calcular_e_mostrar_cr_geral(alunos)

        cr_geral = {}
       
          @alunos.each do |aluno| 

              carga_turma = soma_turma(@alunos, aluno.cod)

            cr_geral[aluno.cod] ||= { soma_notas: 0, soma_cargas: 0}


            cr_geral[aluno.cod][:soma_notas] += aluno.CalculaCr
            cr_geral[aluno.cod][:soma_cargas] += carga_turma
            
          
            #Chama o método de mostrar a média dos alunos
            #mostrar_media_cr_cursos(alunos)
          end

          puts "------- O CR dos alunos é: --------"
          cr_geral.each do |cod_al, valores|

            
            #array_cr_geral = 
            puts "#{cod_al}  -  #{(valores[:soma_notas] / valores[:soma_cargas]).to_i}" 
            
          end
          puts "-----------------------------------"

      end

      def soma_turma(alunos, cod_aluno)
        soma_turma = 0
        
        @alunos.each do |aluno| 
          if aluno.cod == cod_aluno
              soma_turma += aluno.carga
          end
        end
        return soma_turma

      end

      
      # Método para mostrar a média de CR dos cursos
      def mostrar_media_cr_cursos(alunos)
        puts "----- Média de CR dos cursos ------"
        alunos.group_by(&:curso).each do |codigo_curso, alunos_curso|
          total_cr_curso = alunos_curso.sum(&:CalculaCr)
          total_carga_horaria_curso = alunos_curso.sum(&:carga)
          media_cr_curso = total_cr_curso / total_carga_horaria_curso
          puts "#{codigo_curso}   -  #{media_cr_curso}"
        end
        puts "-----------------------------------"
      end
 


end