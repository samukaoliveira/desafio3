class Calcula
    

    def initialize(aluno, nota, carga_disc, carga_turma)
        @aluno = aluno
        @nota = nota
        @carga_disc = carga_disc
        @carga_turma = carga_turma
    end

    def CalculaCr
        media = @nota * @carga_disc / @carga_turma
        resultado = "#{@aluno} - #{media}"

    end

    

end