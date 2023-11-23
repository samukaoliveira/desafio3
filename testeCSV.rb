require 'csv'

def ler_e_mostrar_dados_csv(nome_arquivo)
  # Utilize CSV.read para obter uma matriz dos dados
  dados = CSV.read(nome_arquivo, headers: true)

  # Exibir os dados lidos
  puts "------- Alunos lidos do CSV --------"
  dados.each do |row|
    matricula = row[0]
    nota = row[1].to_f
    carga_horaria = row[2].to_i
    codigo_curso = row[3]

    puts "Matricula: #{matricula}, Nota: #{nota}, Carga Horária: #{carga_horaria}, Código do Curso: #{codigo_curso}"
  end
  puts "------------------------------------"
end

# Uso do método para ler e exibir os dados do CSV
ler_e_mostrar_dados_csv('notas.csv')
