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

    def CalculaCr
        @nota * @carga
    end




end