# Diagrama de sequência — Lançar ocorrência

Relacionado a: [HU04](../requisitos/documento-de-requisitos.md#4-histórias-de-usuário--professor), [RN03–RN07](../requisitos/documento-de-requisitos.md#3-regras-de-negócio).
Fonte original: [`fonte/lancar-ocorrencia.txt`](fonte/lancar-ocorrencia.txt) (formato [sequencediagram.org](https://sequencediagram.org)).

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

    P->>App: 4: verOcorrencias(Aluno)
    App->>+ERP: 4.1: getOcorrencias(idAluno)
    ERP-->>-App: lista[Ocorrencia]
    App-->>P: mostra as ocorrências do aluno
    Note left of App: Nova ocorrência → passo 5<br/>Ver ou editar → passos 6 e 7

    alt Nova ocorrência
        P->>App: 5: criarOcorrencia(dados da ocorrência)
        App->>+ERP: 5.1: postOcorrencia(data, disciplina, tipo, descricao)
        Note left of ERP: A ocorrência aguarda validação<br/>da direção antes de ir ao responsável (RN04)
        ERP-->>-App: sucesso
    else Ver e editar ocorrência
        P->>App: 6: selecionarOcorrencia(idOcorrencia)
        App->>+ERP: 6.1: getOcorrencia(idOcorrencia)
        ERP-->>-App: dados da ocorrência
        App-->>P: mostra a ocorrência
        P->>App: 7: editarOcorrencia(novos dados)
        App->>+ERP: 7.1: patchOcorrencia(idProfessor, idOcorrencia, data, disciplina, tipo, descricao)
        Note right of App: Só o autor e cargos administrativos<br/>podem editar
        ERP-->>-App: sucesso
    end
```
