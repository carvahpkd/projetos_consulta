#language: pt

Funcionalidade: Cadastro de usuario no Groupon
  Eu, como novo usuário do Groupon
  Desejo realizar o meu cadastro
  Para que eu possa ter acesso a todas as promoções

@general
@cadastro_sucesso
  Cenario: Cadastro com sucesso

  Dado que eu acesse a pagina de cadastro
  Quando eu informar os campos obrigatórios
    E clicar em cadastrar
  Entao o meu cadastro e efetuado com sucesso