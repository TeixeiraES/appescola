# Diagrama de sequência — Lançar anotação

Relacionado a: [HU03](../requisitos/documento-de-requisitos.md#4-histórias-de-usuário--professor), [RN03–RN08](../requisitos/documento-de-requisitos.md#3-regras-de-negócio).
Fonte original: [`fonte/lancar-anotacao.txt`](fonte/lancar-anotacao.txt) (formato [sequencediagram.org](https://sequencediagram.org)).

```mermaid
sequenceDiagram
    actor P as Professor
    participant App as AppEscola
    participant ERP as Sistema ERP da escola

    P->>App: 1: verTurmas(Professor)
    App->>+ERP: 1.1: getListaDeTurmas(idProfessor)
    ERP-->>-App: lista[Turma]
    Note left of App: Se houver só uma turma,<br/>pula direto para o passo 2
    App-->>P: mostra a lista de turmas

    P->>App: 2: selecionarTurma(Turma)
    App->>+ERP: 2.1: getTurmaInfo(idTurma)
    ERP-->>App: lista[Aluno]
    App-)ERP: 2.2: getListaDePerguntas(idTurma) (assíncrona)
    ERP--)-App: lista[Pergunta]
    App-->>P: mostra a lista de alunos

    P->>App: 3: selecionarAluno(Aluno)
    App->>+ERP: 3.1: getAlunoInfo(idAluno)
    ERP-->>-App: { alunoNome, dataDeNascimento, responsavel }
    App-->>P: mostra os dados do aluno

    P->>App: 4: verAnotacoes(Aluno)
    App->>+ERP: 4.1: getAnotacoes(idAluno)
    ERP-->>-App: lista[Anotacao]
    App-->>P: mostra as anotações do aluno
    Note left of App: Nova anotação → passo 5<br/>Ver ou editar → passos 6 e 7

    alt Nova anotação
        P->>App: 5: criarAnotacao(dados da anotação)
        App->>+ERP: 5.1: postAnotacao(data, disciplina, tipo, descricao)
        ERP-->>-App: sucesso
    else Ver e editar anotação
        P->>App: 6: selecionarAnotacao(idAnotacao)
        App->>+ERP: 6.1: getAnotacao(idAnotacao)
        ERP-->>-App: dados da anotação
        App-->>P: mostra a anotação
        P->>App: 7: editarAnotacao(novos dados)
        App->>+ERP: 7.1: patchAnotacao(idProfessor, idAnotacao, data, disciplina, tipo, descricao)
        Note right of App: Só o autor e cargos administrativos<br/>podem editar
        ERP-->>-App: sucesso
    end
```
