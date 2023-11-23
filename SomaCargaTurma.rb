require 'csv'

class Aluno
  attr_accessor :matricula, :nota, :carga_horaria, :codigo_curso

  def initialize(matricula, nota, carga_horaria, codigo_curso)
    @matricula = matricula
    @nota = nota
    @carga_horaria = carga_horaria
    @codigo_curso = codigo_curso
  end

  def calcular_cr
    @nota * @carga_horaria
  end
end

class CalculadoraCR
  def initialize
    @alunos = []
  end

  def ler_arquivo_csv(nome_arquivo)
    CSV.foreach(nome_arquivo, headers: true) do |row|
      aluno = Aluno.new(row['Matricula'], row['Nota'].to_f, row['CargaHoraria'].to_i, row['CodigoCurso'])
      @alunos << aluno
    end
  end

  def calcular_e_mostrar_cr
    puts "------- O CR dos alunos é: --------"
    @alunos.each do |aluno|
      cr = aluno.calcular_cr
      puts "#{aluno.matricula}  -  #{cr}"
    end
    puts "-----------------------------------"

    mostrar_media_cr_cursos
  end

  def mostrar_media_cr_cursos
    puts "----- Média de CR dos cursos ------"
    cursos = @alunos.map(&:codigo_curso).uniq
    cursos.each do |curso|
      alunos_curso = @alunos.select { |aluno| aluno.codigo_curso == curso }
      total_cr_curso = alunos_curso.sum(&:calcular_cr)
      total_carga_horaria_curso = alunos_curso.sum(&:carga_horaria)
      media_cr_curso = total_cr_curso / total_carga_horaria_curso
      puts "#{curso}   -  #{media_cr_curso}"
    end
    puts "-----------------------------------"
  end
end

# Uso da classe CalculadoraCR
calculadora = CalculadoraCR.new
calculadora.ler_arquivo_csv('notas.csv')
calculadora.calcular_e_mostrar_cr
