# Diagrama de sequência — Fazer chamada

Relacionado a: [HU05](../requisitos/documento-de-requisitos.md#4-histórias-de-usuário--professor), [RN13–RN15](../requisitos/documento-de-requisitos.md#3-regras-de-negócio).
Fonte original: [`fonte/fazer-chamada.txt`](fonte/fazer-chamada.txt) (formato [sequencediagram.org](https://sequencediagram.org)).

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

    P->>App: 3: selecionarChamada(data, Professor)
    App->>+ERP: 3.1: getChamada(data = hoje, idProfessor)
    ERP-->>-App: lista de chamada (pode ser nula)
    App-->>P: mostra a lista de chamada

    alt Ainda não existe chamada na data
        P->>App: 4: lancarChamada(Aluno)
        App->>+ERP: 4.1: postEntradaDeDiario(data, idTurma)
        Note left of ERP: Cria uma entrada de diário por aluno,<br/>ligada à chamada com o atributo de presença
        ERP-->>-App: sucesso
    else Chamada já existe
        P->>App: 4: lancarChamada(Aluno)
        App->>+ERP: 4.1: patchEntradaDeDiario(data, idTurma)
        Note left of ERP: Atualiza a chamada da entrada de diário<br/>de cada aluno da turma
        ERP-->>-App: sucesso
    end
```
