Dado(/^que eu acesse a pagina de cadastro$/) do
  visit "https://goo.gl/1VxoEh"
end

Quando(/^eu informar os campos obrigatórios$/) do
  @cadastro_groupon.genero.select(@genero)
  @cadastro_groupon.primeiro_nome.set(@primeiro_nome)
  @cadastro_groupon.sobrenome.set(@sobrenome)
  @cadastro_groupon.cpf.set(@cpf)
  @cadastro_groupon.rua.set(@rua)
  @cadastro_groupon.numero_casa.set(@numero_casa)
  @cadastro_groupon.cep.set(@cep)
  @cadastro_groupon.cidade.set(@cidade)
  @cadastro_groupon.email.set(@email)
  @cadastro_groupon.telefone_opcional.set(@telefone_opcional)
  @cadastro_groupon.senha.set(@senha)
  @cadastro_groupon.confirmar_senha.set(@senha)
end

E(/^clicar em cadastrar$/) do
  execute_script "jQuery('#terms-checkbox').click();"
  @cadastro_groupon.botao_cadastrar.click
end

Entao(/^o meu cadastro e efetuado com sucesso$/) do
  expect(page).to have_selector :css, '.icon-arrow-down-large'
end
