# Diagrama de casos de uso

Atores e casos de uso do AppEscola. Fonte original: [`casos-de-uso.drawio`](casos-de-uso.drawio). Abra no [diagrams.net](https://app.diagrams.net) para editar.

```mermaid
flowchart LR
    Prof(["👤 Professor"])
    Resp(["👤 Responsável"])
    Sec(["👤 Secretaria / Direção"])

    subgraph AP["App dos professores"]
        direction TB
        UC1([Fazer chamada])
        UC2([Lançar tarefas])
        UC3([Lançar diário])
        UC4([Lançar anotações])
        UC5([Lançar ocorrências])
        UC6([Consultar comunicados])
        UC7([Consultar mural])
    end

    subgraph BO["Sistema da escola"]
        UC8([Autorizar envio de ocorrências e anotações])
    end

    subgraph AR["App dos responsáveis"]
        direction TB
        UC9([Consultar tarefas])
        UC10([Consultar anotações])
        UC11([Consultar ocorrências])
        UC12([Consultar chamada])
        UC13([Gerar segunda via do boleto])
        UC14([Consultar cardápio])
        UC15([Consultar comunicados])
        UC16([Consultar mural])
        UC17([Consultar agenda])
    end

    Prof --- UC1 & UC2 & UC3 & UC4 & UC5 & UC6 & UC7
    UC3 -. extend .-> UC4
    Sec --- UC8
    Resp --- UC9 & UC10 & UC11 & UC12 & UC13 & UC14 & UC15 & UC16 & UC17
```

## Rastreabilidade

| Caso de uso | História de usuário | Diagrama de sequência |
|---|---|---|
| Fazer chamada | HU05 | [fazer-chamada](../sequencia/fazer-chamada.md) |
| Lançar diário | HU06 | [responder-lista-de-perguntas](../sequencia/responder-lista-de-perguntas.md) |
| Lançar anotações | HU03 | [lancar-anotacao](../sequencia/lancar-anotacao.md) |
| Lançar ocorrências | HU04 | [lancar-ocorrencia](../sequencia/lancar-ocorrencia.md) |
| Lançar tarefas | HU07 | — |
| Consultar chamada | HU10 | — |
| Gerar segunda via do boleto | HU11 | — |
| Consultar agenda | HU12 | — |
| Consultar cardápio, comunicados e mural | HU14–HU16 | — |
