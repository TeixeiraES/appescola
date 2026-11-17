# Diagrama de sequência — Responder lista de perguntas

Relacionado a: [HU06](../requisitos/documento-de-requisitos.md#4-histórias-de-usuário--professor), [RN09–RN14](../requisitos/documento-de-requisitos.md#3-regras-de-negócio), [F01–F02](../requisitos/documento-de-requisitos.md#7-funcionalidades).
Fonte original: [`fonte/responder-lista-de-perguntas.txt`](fonte/responder-lista-de-perguntas.txt) (formato [sequencediagram.org](https://sequencediagram.org)).

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

    P->>App: 4: verDiario(Aluno)
    App->>+ERP: 4.1: getDiario(idAluno)
    ERP-->>-App: lista[idEntradaDeDiario]
    App-->>P: mostra as entradas de diário do aluno

    P->>App: 5: selecionarEntradaDiario(EntradaDeDiario)
    App->>+ERP: 5.1: getEntradaDiario(idEntradaDeDiario)
    ERP-->>-App: lista[Resposta] (pode ser nula)
    Note left of App: Nula → criar respostas (passo 6)<br/>Existente → ver ou editar (passo 7)
    App-->>P: mostra a lista de perguntas (retorno do 2.2)
    App-->>P: mostra as respostas

    alt Criar respostas
        P->>App: 6: responderListaDeResposta(lista[Resposta])
        App->>+ERP: 6.1: postListaDeResposta(lista[Resposta])
        Note left of ERP: Se a chamada do dia tiver falta,<br/>pede confirmação antes de gravar
        App->>P: confirmar o registro mesmo com falta?
        ERP-->>-App: sucesso
    else Editar respostas
        P->>App: 7: editarRespostas(EntradaDeDiario, lista[Resposta])
        App->>+ERP: 7.1: patchListaDeResposta(idProfessor, idEntradaDeDiario, lista[Resposta])
        Note right of App: Só o autor e a coordenação<br/>podem editar (RN11)
        ERP-->>-App: sucesso
    end
```
