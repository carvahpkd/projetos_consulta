login_page = LoginPage.new

Dado("que eu estou na tela de login") do
    login_page.load
end

Quando("preencho meus dados de login") do
    login_page.login.set 'eduardo.finotti@softplan.com.br'
    login_page.senha.set 'amarelo32'
end

Quando("clico no botão entrar") do
    login_page.botaoEntrar.click
end

Então("Eu logo na aplicação com sucesso") do
    expect(page).to have_link("Minha conta")
end