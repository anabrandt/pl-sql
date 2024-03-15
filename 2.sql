BEGIN
    EXECUTE IMMEDIATE 'DROP TABLE Aluno';
EXCEPTION
    WHEN OTHERS THEN
        IF SQLCODE != -942 THEN
            RAISE;
        END IF;
END;

CREATE TABLE Aluno (
    Rm NUMBER PRIMARY KEY,
    nome VARCHAR2(100),
    nota NUMBER,
    media NUMBER,
    situacao VARCHAR2(20)
);

DECLARE
    v_rm1 NUMBER := 1;
    v_nome1 VARCHAR2(100) := 'Ana';
    v_nota1 NUMBER := 7;

    v_rm2 NUMBER := 2;
    v_nome2 VARCHAR2(100) := 'Maria';
    v_nota2 NUMBER := 5;

    v_rm3 NUMBER := 3;
    v_nome3 VARCHAR2(100) := 'Pedro';
    v_nota3 NUMBER := 10;
BEGIN
    INSERT INTO Aluno (Rm, nome, nota) VALUES (552283, v_nome1, v_nota1);

    INSERT INTO Aluno (Rm, nome, nota) VALUES (667788, v_nome2, v_nota2);

    INSERT INTO Aluno (Rm, nome, nota) VALUES (224433, v_nome3, v_nota3); 
    
    DBMS_OUTPUT.PUT_LINE('3 alunos inseridos na tabela Aluno com sucesso.');
END;
/




DECLARE
    v_rm_input NUMBER;
BEGIN
    DBMS_OUTPUT.PUT_LINE('Digite o RM do aluno para determinar a situação:');
    v_rm_input := &rm_input; -- Lendo o RM do aluno inserido pelo usuário
    
    UPDATE Aluno SET media = (SELECT AVG(nota) FROM Aluno WHERE Rm = v_rm_input) WHERE Rm = v_rm_input;
    
    UPDATE Aluno SET situacao = CASE WHEN media > 6 THEN 'Aprovado' ELSE 'Reprovado' END WHERE Rm = v_rm_input;
    
    DBMS_OUTPUT.PUT_LINE('Situação do aluno atualizada com sucesso.');
END;
/

SELECT * FROM ALUNO