pragma solidity ^0.4.0;

contract Presenca{
    struct Aluno{
        bool matriculado;
        uint presencas;
    }

    address professor;
    mapping(address => Aluno) turma;

    function Presenca(){
        // Professor cria o contrato
        professor = msg.sender;
    }

    function registraAluno(address aluno){
        if (msg.sender != professor) return;
        turma[aluno].matriculado = true;
    }

    function assinaPresenca(){
        // Aluno assina a lista de presenca
        if (msg.sender == professor || turma[msg.sender].matriculado == false) return;
        turma[msg.sender].presencas += 1;
    }

}
