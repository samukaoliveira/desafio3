require_relative 'Leitura2'
require_relative 'SomaAluno'
require_relative 'Calcula'
require_relative 'ListaAluno'


class MediaAluno


    def initialize(lista_aluno)
        @lista_aluno = lista_aluno
    end


    def calculaMedia

        media_por_aluno = {}

        @lista_aluno.coluna1_distintos.each do |valor|
            
            aluno_cr = CalculaCrAlunos.new(valor, valor[3], valor[4], soma.somar(cod, 4))
            resultado1 = aluno_cr.CalculaCrAlunos

            puts resultado1
            return resultado1
        
        end
        

        
    end


end