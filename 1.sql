DECLARE
    v_sal NUMBER(10,2); 
    v_descont NUMBER(10,2);
BEGIN
    
    DBMS_OUTPUT.PUT_LINE('Digite o salário:');

    v_sal := &salario;
    

    IF v_sal <= 1513.69 THEN
        v_descont := 0; 
    ELSIF v_sal <= 2725.12 THEN
        v_descont := v_sal * 0.16; 
    ELSE
        v_descont := v_sal * 0.285; 
    END IF;


    v_descont := v_sal - v_descont;

    DBMS_OUTPUT.PUT_LINE('O salário líquido é: ' || v_descont);
END;
/



