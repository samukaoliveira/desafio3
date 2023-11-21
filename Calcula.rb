class Calcula
    
    attr_accessor :nota
    attr_accessor :carga_aluno
    attr_accessor :carga_turma
end

class CalculaCrAlunos < Calcula
    
    def initialize(nota, carga_aluno, carga_turma)
        @nota = nota
        @carga_aluno = carga_aluno
        @carga_turma = carga_turma
    end

    def CalculaCrAlunos
        cr = @nota * @carga_aluno / @carga_turma
        return cr
    end

end

class CalculaCrCurso < Calcula
    
    def CalculaCrTurma(nota, carga_aluno, carga_turma)
    end

end