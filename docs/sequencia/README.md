# Diagramas de sequência

Os fluxos de comunicação entre o professor, o app e o ERP da escola, um para cada caso de uso principal.

| Caso de uso | Diagrama | Fonte original |
|---|---|---|
| Fazer chamada | [fazer-chamada.md](fazer-chamada.md) | [txt](fonte/fazer-chamada.txt) |
| Responder lista de perguntas (diário) | [responder-lista-de-perguntas.md](responder-lista-de-perguntas.md) | [txt](fonte/responder-lista-de-perguntas.txt) |
| Lançar anotação | [lancar-anotacao.md](lancar-anotacao.md) | [txt](fonte/lancar-anotacao.txt) |
| Lançar ocorrência | [lancar-ocorrencia.md](lancar-ocorrencia.md) | [txt](fonte/lancar-ocorrencia.txt) |

Os diagramas foram desenhados no [sequencediagram.org](https://sequencediagram.org). As fontes estão na pasta [`fonte/`](fonte/), e para abrir basta colar o conteúdo no site. As versões em Mermaid são desenhadas pelo próprio GitHub.

Os quatro fluxos começam igual: escolher a turma (passos 1–2) e o aluno (passo 3). A lista de perguntas da turma é carregada de forma **assíncrona** no passo 2.2, para já estar pronta quando o professor abrir o diário.
