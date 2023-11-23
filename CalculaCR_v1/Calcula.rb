class Calcula
    
    attr_accessor :aluno, :nota, :carga_disc, :carga_turma
    
    def initialize(aluno, nota, carga_disc, carga_turma)
        @aluno = aluno
        @nota = nota
        @carga_disc = carga_disc
        @carga_turma = carga_turma
    end

    def CalculaCrAlunos
        media = @nota * @carga_disc / @carga_turma
        resultado = "#{@aluno} - #{media}"

    end

end