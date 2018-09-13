=====COMANDOS CUCUMBER====

cucumber --init  #Cria estrutura de pastas padrão
cucumber -d  #gera os steps de forma rápida
cucumber  #Executa o projeto
cucumber features/nomedocenario.feature #Executa a feature especificada
cucumber --tags @nometag ou cucumber -t @tag #Executa os cenarios por tag
cucumber feature/exemplo.feature:20  #Executa apenas o cenário encontrado na linha 20
cucumber chrome=true #Executa a feature no browser solicitado 
cucumber user=teste.jose senha=123456 #Executa a feature com o parâmetro solicitado
bundle exec cucumber #executa o projeto e as versões do mesmo
bundle exec cucumber features/specs/1-login.feature

=====AÇÕES BÁSICAS CAPYBARA====

#****MAXIMIZA BROWSER
page.driver.browser.manage.window.maximize
page.driver.browser.manage.window.resize_to(1366,768)

#****SCREENSHOT
save_screenshot("/data/1_nome_evidencia.png")

#****ACESSA URL
visit('http://www.inmetrics.com.br')
visit(site)

#****VALIDA TITULO OU URL
page.has_title? 'https:\\globo.com'

#****TEMPORIZADOR
sleep
find("id_elemento", wait:7)
Capybara.default_max_wait_time = 12

#****CLICAR NO BOTÃO
click_button('Nome do botão') 

#****CLICAR NO LINK 
click_link('Texto de um link')

#****SELECIONA RADIO BUTTON
choose("radio_id")

#****COMBO BOX DROPDOWN 
select('Janeiro', from: 'campo_mes')
page.select 'March', :from => 'Month'

unselect('Janeiro', from: 'campo_mes')
page.unselect 'March', :from => 'Month'

#****SELECT BOX   
check('Id_check') 
page.check('German')
find(:id, "#cityID[value='62']").set(true)

uncheck('id_check')
page.uncheck('German')
find(:id, "#cityID[value='62']").set(false)

#****ANEXAR ARQUIVOS 
attach_file('image', 'caminho/da/imagem.jpg')
page.attach_file(locator, '/path/to/imagem.png')
attach_file Rails.root.join('spec/fixture/some_file.png')

#****PREECHIMENTO DE CAMPOS
fill_in('Id do campo', with: 'valor')
page.fill_in 'Name', :with => 'Bob'

#****VALIDA TEXTO NA PAGINA
assert_text('Seu Texto Aqui')
assert_selector ('CSS')
expect(page).to have_content 'Seu Texto Aqui'

#****CAPTURA PRIMEIRO ELEMENTO
first("input[class='nome_elemento']").click

#****MOUSE OVER
find('.some_class').hover

=====USANDO O FIND=====

#****PROCURA ELEMENTO E CLICA
find_link("Ponto Frio").click

find(:id, 'id do elemento').click 
find(:css, 'css do elemento').click 
find(:xpath, 'xpath do elemento').click

page.find_field("test_field").value
page.find_by_id('red').tag_name
page.find_link('abo').text
page.find_link('other')[:href]

#****FIND COM checkbox, radiobutton
find(:radio_button, 'nome do radiobutton').set(true) 
find(:checkbox, 'nome do checkbox').set(true) 

#****FIND COM MENU DE SELECAO 
find("span[class='btn-abre-saudacao']").hover
find("span” , text: “Quem Somos").click

find("a[href='#/extrato']").click
expect(page).to have_content(“Meu Texto”)
find(:id, 'my_id').native.send_keys(:enter)

#****FIND COM ACAO DO TECLADO 
find("input[placeholder ='Busque um produto em ponto-frio']").native.send_keys(:enter)

#****CLICAR NO PRIMEIRO ELEMENTO 
page.all(:id, 'id do elemento')[0].click 
page.all(:css, 'css do elemento')[0].click  
page.all(:xpath, 'xpath do elemento')[0].click  

page.all(:xpath, '//a')
page.first(:xpath, '//a')
page.find('//textarea[@id="additional_newline"]')
page.find(:xpath, "//input[@id='form_pets_dog']")['checked']
page.find(:css, '#with_focus_event').trigger(:focus)
page.find(:css, '.wrapper').hover

# encontra elementos invisíveis quando falsa
page.find_by_id("hidden_via_ancestor", visible: false)
page.find_button('What an Awesome')[:value]


====FIND INSPECIONAR ELEMENTOS====
O elemento (Exemplo de finds, pode ser usado com .click ou outra action)

<button id="btn-one" type="button" class="btn btn-lg btn defalt">One</button>

find("button[id='btn-one']")
find("button[type='button']")
find("button[class='btn btn-lg btn defalt']")
find('button', txt: 'One')

find(:xpath, "//*[@id='btn-one']")
find(:xpath, "//*[@class='btn btn-lg btn defalt']")
find(:xpath, "//*[@type='button']")

#****USANDO FIND EM TECLADO VIRTUAL
find(".btn-usersenha", text: '1').click
find(".btn-usersenha", text: '4').click
find(".btn-usersenha", text: '7').click
find(".btn-usersenha", text: '2').click
find(".btn-usersenha", text: '5').click
find(".btn-usersenha", text: '8').click


====CAPYBARA MATCHERS====

expect(page).to have_content("Some Content")
expect(page).to have_no_content("Some Content")

# Verdadeiro se há uma marca de âncora com regex correspondência de texto
expect(page).to have_xpath("//a")
expect(page).to have_xpath("//a",:href => "google.com")
expect(page).to have_xpath("//a[@href => 'google.com']")
expect(page).to have_xpath("//a[contains(.,'some string')]")
expect(page).to have_xpath("//p//a", :text => /re[dab]i/i, :count => 1)

# pode tomar tanto XPath e css como entrada e pode levar argumentos semelhantes para ambos have_css e have_xpath
expect(page).to have_selector(:xpath, "//p/h1")
expect(page).to have_selector(:css, "p a#post_edit_path")
expect(page).to have_css("input#post_title")
expect(page).to have_css("input#post_title", :value => "Capybara cheatsheet")

# Verdadeiro se existem 3 tags de entrada em resposta
expect(page).to have_css("input", :count => 3)
# Verdadeiro se há ou menos ou igual a 3 tags de entrada 
expect(page).to have_css("input", :maximum => 3)
# Verdadeiro se há mínimo de 3 marcas de entrada
expect(page).to have_css("input", :minimum => 3)
# Verdadeiro se houver 1 a 3 tags de entrada
expect(page).to have_css("input", :between => 1..3)
# Verdadeiro se há uma marca de âncora com o texto Olá
expect(page).to have_css("p a", :text => "hello")
expect(page).to have_css("p a", :text => /[hH]ello(.+)/i)

# Para fazer capybara tomar css como seletor de padrão
Capybara.default_selector = :css

# controlos para a presença da marca de entrada
expect(page).to have_selector("input")

# verifica se há marca de entrada com o valor
expect(page).to have_selector("input", :value =>"Post Title")
expect(page).to have_no_selector("input")

# Para fazer capybara tomar css como seletor de padrão
Capybara.default_selector = :xpath

# checks for the presence of the input tag
expect(page).to have_selector("//input")

# verifica se há marca de entrada com o valor
expect(page).to have_selector("//input", :value =>"Post Title")

# controlos para a presença de um campo de entrada chamada NomePróprio numa forma
expect(page).to have_field("FirstName")
expect(page).to have_field("FirstName", :value => "Rambo")
expect(page).to have_field("FirstName", :with => "Rambo")
expect(page).to have_link("Foo")
expect(page).to have_link("Foo", :href=>"googl.com")
expect(page).to have_no_link("Foo", :href=>"google.com")

=====USANDO O WHITHIN====

# Elemento para encontrar valor por uma linha (lista) e clicar no link com Whitin
  within("tr", text: "Testes QA") do
    find(".fa-pencil").click
end

# Esses dois são as mesmas coisas, só que um, é a função inline
within("tr", text: "Testes QA") {find(".fa-pencil").click}

@variavel = @resource.alterar
 within("div", text: "So Titulo Testes") do
 find(@variavel).click
end

page.second("i[class='fa fa-fw fa-pencil']").click
first("@variavel").click

first.(@variavel).click
click_link(@variavel, :match => :one)
page.first(@variavel, minimum: 1).click

within find(@variavel) do
find(@variavel).click
end


Capybara Scoped Finder within

within(search_form) do
  fill_in 'Name', with: 'iOS 7'
  click_button 'Search'
end

def search_form
  '.search_form'
end

within_fieldset("villain_fieldset") do
  # ...
end

within_table("some_table") do
  # ...
end

# Executar o bloco dada dentro do iframe dada usando o nome dado quadro ou índice.
within_frame('some_frame') do
end

# You need to install launchy gem.
save_and_open_page
Capybara Common

page.current_url

# Execute o script determinado , não retornando um resultado. Isso é útil para scripts que retornam objetos complexos # , como instruções jQuery. + Execute_script + deve ser usado sobre # + Evaluate_script + sempre que possível.
page.execute_script("$('#change').text('Funky Doodle')")

# Avaliar a determinado JavaScript e retornar o resultado . Tenha cuidado ao usar isso com # scripts que retornam objetos complexos, tais como declarações jQuery. + Execute_script + poder # Ser uma alternativa melhor .
page.evaluate_script("1+3")
# => 4

using_wait_time 6 do
... Changed Capybara.default_wait_time in this block scope.
end



==================================================================================

# Podemos verificar se está na página correta com a função have_current_path.
expect(page).to have_current_path(Urls[target], url: true)
# url: true -> ele compara a url toda, sem isso ele compara uma parte.

# Podemos deixar o env.rb já a url padrão configurada.
Capybara.app_host = "https://orangehrm-demo-6x.orangehrmlive.com"
  
# Visitar a sub-url /auth/login.
visit "/auth/login"
 
find("#btn_login").click
find('.clickable-text', :text => 'Click me').click
  
Capybara Finders (Usando a Busca do elemento no Capybara).
  
# Procura todos os elementos via xpath.
all(:xpath, '//a')
# Procura todos os elementos via css.
all(:css, 'a')
# Procura todos os elementos via css, e selecionar somente o primerio.
all(:css, 'a')[1]
# Procura o primeiro elemento que encontrar via xpath.
first(:xpath, '//a')
# Procura o primeiro elemento que encontrar via css.
first(:css, 'a')
# Procura o elemento elemento via xpath que tem o atributo id. 
find('//textarea[@id="additional_newline"]')
# Procura o elemento elemento via xpath que tem o atributo id e o checked. 
find(:xpath, "//input[@id='form_pets_dog']")['checked']
# => true
  
# Procura o elemento via css e ativa o focus sobre o elemento.
find(:css, '#with_focus_event').trigger(:focus)
find(:css,'.wrapper').hover
  
# Procura o elemento e traz o valor.
find_field("test_field").value
# => 'blah'
  
# Procura o elemento e traz a tag do elemento.
find_by_id('red').tag_name
# => 'a'
  
# Procura o elemento invisível pelo atributo id. 
find_by_id("hidden_via_ancestor", visible: false)
 
# Procura o butão pelo nome e traz o atributo value(texto).
find_button('What an Awesome')[:value]
# => 'awesome'
  
# Procura o elemento link pelo nome e traz o texto.
find_link('abo').text
# => 'labore'
  
# Procura o elemento link pelo nome e traz o href(caminho do link).
find_link('other')[:href]
# => '/some_uri'
  
# Procura todos os elementos com a tag a, e faz um for para trazer o href dos elementos. 
all('a').each { |a| a[:href] }
  
# Procura um elemento pela class bar(.) dentro do elemento ID foo(#). 
find('#foo').find('.bar')

Capybara Scoped Finder within
  
within(search_form) do
  fill_in 'Name', with: 'iOS 7'
  click_button 'Search'
end
  
def search_form
  '.search_form'
end
  
within_fieldset("villain_fieldset") do
  # ...
end
  
within_table("some_table") do
  # ...
end
# Execute um bloco de código em um determinado iframe/frame pelo nome ou o índice do quadro fornecido. Fora do bloco ele volta para o contexto inicial da página (função usada <b>within_frame</b>).
# within_frame('some_frame') do CODE end
# within_frame 0 do CODE end
  def check_balance
    visit('/')
     within_frame('main'){
      fill_in 'korisnik', :with => 'foo'
      fill_in 'lozinka', :with => 'bar'
      click_button 'Potvrda unosa'
    }
    within_frame('header'){
      click_on 'Stanje' 
    }
  end
  
# Iframe dentro de iframe podemos fazer assim.
within_frame 0 do
  within_frame 0 do
    within_frame 0 do
      # Code
    end
  end
end
  
  
# sem o within_frame, podemos fazer com a função switch_to.
 
def check_balance
  visit('/')
# Vai trocar do contexto inicial para o frame header.
  page.driver.browser.switch_to.frame 'header'
  click_on 'Stanje' 
# Vai trocar o frame header para o contexto inicial da página.
  page.driver.browser.switch_to.default_content
# Vai trocar do contexto inicial para o frame main. 
  page.driver.browser.switch_to.frame 'main'
# Vai trocar do frame Pai main para o subframe subframe_main. 
  page.driver.browser.switch_to.frame 'subframe_main'
  fill_in 'korisnik', :with => 'foo'
  fill_in 'lozinka', :with => 'bar'
  click_button 'Potvrda unosa'
end
  
# Uma coisa legal que podemos fazer procurar o iframe, para depois mudar com o switch_to.
facebok_iframe_name = find(:xpath, "//*[@id='fb-button-explore']/span/iframe")[:name]
page.driver.browser.switch_to.frame facebok_iframe_name 
Capybara Common

# Imprime o titulo da página.
puts page.title
  
# Verifica se o titulo corresponde ao valor "my title".
page.has_title? "my title"
  
# Verifica se o titulo "my not found title" não existe mais.
page.has_no_title? "my not found title"
  
# Execute the given script, not returning a result. This is useful for scripts that return
# complex objects, such as jQuery statements. +execute_script+ should be used over
# +evaluate_script+ whenever possible.
page.execute_script("$('#change').text('Funky Doodle')")
  
# Evaluate the given JavaScript and return the result. Be careful when using this with
# scripts that return complex objects, such as jQuery statements. +execute_script+ might
# be a better alternative.
page.evaluate_script("1+3")
# => 4
  
using_wait_time 6 do
 # ... Changed Capybara.default_wait_time in this block scope.
end

  
# Verifica se tem o css selector, que tem o campo com visibilidade igual a falso. 
expect(page).to have_selector('#selector_id', visible: false)
  
Capybara Matchers (Assert)
  
page.assert_selector('p#foo', :count => 4)
page.assert_selector('li', :text => 'Horse', :visible => true)
page.has_css?('li', :text => 'Horse', :visible => true)
page.has_xpath?('.//li', :text => 'Horse', :visible => true)
page.has_selector?('li', :text => 'Horse', :visible => true)
page.has_field?('Name', :with => 'Jonas')
Capybara Browser functions.
  
====TRABALHANDO COM JANELAS E POPUP
# Para mudar para uma outra janela, ou seja  mudar de contexto de uma janela inicial para a última aberta, 
# Precisamos encontrar a ultima janela com a função window_handles.last e mudar para a atual com a função switch_to.
popup = page.driver.browser.window_handles.last
page.driver.browser.switch_to.window(popup)
# Podemos voltar para a primeira janela.
main = page.driver.browser.window_handles.first
page.driver.browser.switch_to.window(main)
Capybara Configurações.
  
# Mudando a espera máxima de 2 segundos para 30 segundos.
Capybara.default_max_wait_time = 30
  
# Segunda forma de setar várias configurações.
Capybara.configure do |config|
  config.run_server = false
  config.app_host   = 'http://www.google.com'
  config.default_max_wait_time = 30
  config.default_selector = :css
end
  Tratamento de erro com 'rspec/retry'.
  
RSpec.configure do |config|
  # show retry status in spec process
  config.verbose_retry = true
  # Try twice (retry once)
  config.default_retry_count = 2
  # Only retry when Selenium raises Net::ReadTimeout
  config.exceptions_to_retry = [Net::ReadTimeout]
  Capybara.javascript_driver = :webkit
end

find(:select, from, options).find(:option, value, options).select_option,
select "option_name_here", :from => "organizationSelect"
find('#buscadores').find('option', text: 'Altavista').select_option

page.current_window.resize_to(1280, 800)
page.execute_script 'document.getElementById("nav-mobile").scrollTop += 200;'

====USER AGENT ====
https://developers.whatismybrowser.com/useragents/explore/software_name/chrome/

require 'capybara'
require 'selenium-webdriver'

Capybara.register_driver :chrome do |app|
  args = []
  args << "--window-size=320,480"
  args << "--user-agent='Mozilla/5.0 (iPhone; CPU iPhone OS 5_0 like Mac OS X) AppleWebKit/534.46 (KHTML, like Gecko) Version/5.1 Mobile/9A334 Safari/7534.48.3'"
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :args => args)
end

session = Capybara::Session.new(:chrome)

session.visit("https://www.w3schools.com/cssref/tryit.asp?filename=trycss_sel_hover")
session.find('#iframeResult')
p session.evaluate_script("navigator.userAgent")