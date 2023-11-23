require 'csv'

class Aluno
    attr_accessor :cod, :disciplina, :curso, :nota, :carga, :turma


  def initialize(cod, disciplina, curso, nota, carga, turma)
        @cod = cod.to_i
        @disciplina = disciplina
        @curso = curso.to_i
        @nota = nota.to_f
        @carga = carga.to_i
        @turma = turma.to_i
  end

  def calcular_cr
    @nota * @carga_horaria
  end

  def to_s
    "#{@matricula} - #{@nota} - #{@carga_horaria} - #{@codigo_curso}"
  end
end

# Método para ler e exibir os dados do CSV
def ler_e_mostrar_dados_csv(nome_arquivo)
  alunos = []

  CSV.read(nome_arquivo, headers: true).each do |row|
    
    cod = row[0].to_i
    disciplina = row[1]
    curso = row[2].to_i
    nota = row[3].to_f
    carga = row[4].to_i
    turma = row[5].to_i

  alunos << Aluno.new(cod, disciplina, curso, nota, carga, turma)
  end

  # Exibir os dados lidos
  

  calcular_e_mostrar_cr(alunos)
end

# Método para calcular e mostrar o CR dos alunos
def calcular_e_mostrar_cr(alunos)
  puts "------- O CR dos alunos é: --------"
  alunos.each { |aluno| puts "#{aluno.cod}  -  #{aluno.calcular_cr}" }
  puts "-----------------------------------"

  mostrar_media_cr_cursos(alunos)
end

# Método para mostrar a média de CR dos cursos
def mostrar_media_cr_cursos(alunos)
  puts "----- Média de CR dos cursos ------"
  alunos.group_by(&:codigo_curso).each do |codigo_curso, alunos_curso|
    total_cr_curso = alunos_curso.sum(&:calcular_cr)
    total_carga_horaria_curso = alunos_curso.sum(&:carga_horaria)
    media_cr_curso = total_cr_curso / total_carga_horaria_curso
    puts "#{codigo_curso}   -  #{media_cr_curso}"
  end
  puts "-----------------------------------"
end

# Uso do método para ler e exibir os dados do CSV
ler_e_mostrar_dados_csv('notas.csv')
