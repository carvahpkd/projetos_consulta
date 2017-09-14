# Treinamento Cucumber

Aula 3 - Aprendendo a lidar com o Git

[![CircleCI](https://circleci.com/gh/tiagonline/cucumber_aula3.svg?style=svg)](https://circleci.com/gh/tiagonline/cucumber_aula3)

Comandos básicos do Git

```ruby
git status = Verifica o status atual do meu projeto (se add coisas, se alterei coisas, se removi coisas);
git add + arquivo = Adiciona o arquivo em Staging;
git checkout -b "INICIAIS-Nome_branch" = Cria uma nova branch;
git pull = Traz de algum lugar para outro lugar, exemplo:
git pull origin branch = git pull origin master (Trazendo o conteúdo da branch master para minha branch local);
git branch -d Nome da Branch = Deleta a branch;
git commit -m "Mensagem" = Commita com uma mensagem;
git push = Envia para o repositório;
git reset + arquivo = Tira de Staging e volta pra local;
git rm + arquivo = Também remove o arquivo;
```

```ruby
Comandos básicos para iniciar um projeto em Cucumber.

cucumber -- init = Inicia um projeto novo.

Organizar da seguinte maneira:

  nome_projeto
  cucumber
  features
  specifications
  step_definitions
  support
  hooks
  page_objects

No nosso arquivo de Enviroment (env.rb) vamos definir da seguinte maneira:

require 'capybara/cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'faker'
require 'cpf_faker'
require 'site_prism'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 60

Capybara.app_host = ""
```
