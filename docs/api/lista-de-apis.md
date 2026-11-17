# Lista de chamadas de API

As chamadas de API consumidas pelos apps do AppEscola. O fluxo de comunicação saiu dos [diagramas de sequência](../sequencia/) de cada caso de uso.

> Este é o contrato definido na fase de análise. Na implementação, os endpoints reais do ERP têm outros nomes (por exemplo, `wsAlunosGrau`, `wsGetAnotacoesOcorrencias`). Veja [`api_calls.dart` do app dos professores](../../apps/professores/lib/backend/api_requests/api_calls.dart) e [do app dos responsáveis](../../apps/responsaveis/lib/backend/api_requests/api_calls.dart).

## GET

| Chamada | Parâmetros | Retorno |
|---|---|---|
| `getListaDeTurmas(idProfessor)` | `idProfessor`: professor logado | `lista[Turma]`: turmas do professor |
| `getTurmaInfo(idTurma)` | `idTurma`: identificador da turma | `lista[Aluno]`: alunos matriculados |
| `getListaDePerguntas(idTurma)` *(assíncrona)* | `idTurma`: identificador da turma | `lista[Pergunta]`: perguntas da turma |
| `getAlunoInfo(idAluno)` | `idAluno`: identificador do aluno | `alunoNome`, `dataDeNascimento`, `alunoResponsavel` (strings) |
| `getDiario(idAluno)` | `idAluno`: identificador do aluno | `lista[EntradaDeDiario]`: cada entrada traz a presença na data |
| `getEntradaDiario(idEntradaDeDiario)` | `idEntradaDeDiario`: identificador da entrada | `lista[Resposta]`: respostas daquela entrada |

## POST

| Chamada | Parâmetros |
|---|---|
| `postEntradaDiario(lista[Resposta])` | `lista[Resposta]`: respostas da lista de perguntas preenchidas pelo usuário |

## PATCH

| Chamada | Parâmetros |
|---|---|
| `patchEntradaDeDiario(idEntradaDeDiario, lista[Resposta])` | `idEntradaDeDiario`: identificador da entrada; `lista[Resposta]`: respostas novas |
