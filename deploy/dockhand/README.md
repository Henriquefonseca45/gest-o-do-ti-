# GLPI no Dockhand

Esta stack usa a imagem oficial do GLPI, instala o banco automaticamente na
primeira inicializacao e mantem os dados em volumes nomeados do Docker.

## Importacao pelo Git

No Dockhand, crie uma stack **From Git** e informe:

- Compose file path: `deploy/dockhand/compose.yaml`
- Context directory: `deploy/dockhand`
- Porta padrao: `8085`

Cadastre as variaveis abaixo no ambiente da stack antes do deploy:

- `GLPI_DB_PASSWORD`: senha do usuario da aplicacao no MariaDB
- `MARIADB_ROOT_PASSWORD`: senha administrativa do MariaDB

As demais variaveis possuem valores padrao e podem ser sobrescritas usando
como referencia o arquivo `.env.example`.

## Importacao manual

Copie `compose.yaml` para o editor de stacks do Dockhand, configure as duas
senhas obrigatorias e escolha **Save & Deploy**.

Depois que os healthchecks estiverem saudaveis, acesse:

`http://localhost:8085`

Credenciais iniciais do GLPI:

- Usuario: `glpi`
- Senha: `glpi`

Troque a senha imediatamente no primeiro acesso.

## Persistencia e atualizacoes

- `glpi_data`: configuracoes, arquivos, logs e marketplace do GLPI.
- `db_data`: banco MariaDB.
- A imagem executa migracoes automaticamente ao atualizar a tag do GLPI.
- Nao remova os volumes ao recriar ou atualizar a stack.
