# Query Doctor API

## API para CRUD para
* Convenios
* Especialidades medicas
* Medicos
* Pacientes

No root path da API estao disponiveis todos os entrypoints que utilizam o padrao RESTFul

Há também um arquivo swagger.yml com a descriçao detalhadas de todos os entrypoints da API
Para visualizar o conteudo do swagger.yml recomendo o uso do editor online do swagger https://editor.swagger.io/

## Dependencias
* ruby 2.4.0

## Setup do projeto
Para configuar este projeto clone este repositorio e execute
* bundle install 
* rails db:create
* rails db:migrate 
* rails db:seed
* rails s (API estará disponível na porta 3000)

## Como executar testes
* rake spec
