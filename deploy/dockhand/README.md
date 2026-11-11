# GLPI no Dockhand

Esta stack cria uma imagem derivada da imagem oficial do GLPI, instala o banco
automaticamente e mantem os dados em volumes nomeados do Docker.

O deploy tambem aplica automaticamente:

- idioma padrao `Portugues do Brasil (pt_BR)`;
- idioma `pt_BR` para todos os usuarios existentes;
- tema corporativo RVB em azul e branco;
- identidade RVB na tela de login e navegacao interna.

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
- O servico `configure` pode aparecer como concluido/exited com codigo 0; isso e
  esperado, pois ele apenas aplica idioma e tema apos o GLPI ficar saudavel.
- Nao remova os volumes ao recriar ou atualizar a stack.

## Aplicar uma atualizacao visual

Depois de sincronizar uma alteracao pelo Git, use no Dockhand a opcao de
reconstruir a imagem sem cache e faca o redeploy da stack. Usuarios que estavam
conectados devem sair e entrar novamente para recarregar idioma e tema.
