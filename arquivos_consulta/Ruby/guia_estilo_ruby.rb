
https://github.com/rubensmabueno/ruby-style-guide/blob/master/README-PT-BR.md

O Guia de Estilo Ruby

Este guia de estilo Ruby recomenda as melhores práticas para que programadores reais de Ruby possam escrever códigos que possam ser mantidos por outros programadores reais de Ruby. 
Um guia de estilo que reflete o uso que o mundo real está acostumado e um guia de estilo que se prende a um ideal que foi rejeitado pelo povo supõe-se que o melhor é não usá-lo para nada – não importa o quão bom seja.
O guia é separado em várias seções de regras relacionadas. Tentei adicionar a lógica por trás das regras (se estiver omitido, eu assumi que é bastante óbvio).
Eu não vim com todas as regras do nada - são na maioria com base na minha extensa carreira como profissional de engenharia de software, comentários e sugestões dos membros da comunidade Ruby 
e vários recursos de programação Ruby altamente recomendados, tais como "Programming Ruby 1.9" e "The Ruby Programming Language".
Há algumas áreas em que não há nenhum consenso na Comunidade Ruby em relação um determinado estilo (como estilo de declaração de cadeia de caracteres literais, espaçamento dentro de hashes literais, 
  posição do ponto no método de encadeamento multi-linha, etc.). Em tais situações, todos os estilos populares são reconhecidos e cabe a você escolher um e aplicá-lo de forma consistente.
O guia ainda é um trabalho em andamento - algumas regras possuem exemplos escassos, algumas regras não tem exemplos que as ilustrem claramente. No devido tempo, estas questões serão abordadas - apenas mantenha-los em mente por while.
Você pode gerar um PDF ou uma cópia HTML deste guia usando Transmuter.
RuboCop é um analisador de código, baseado neste guia de estilo.


Tabela de conteúdos

    Layout do código fonte
    Sintaxe
    Nomenclatura
    Comentários
        Anotações em Comentário
    Classes
    Exceções
    Coleções
    Strings
    Expressões Regulares
    Literais Percentuais
    Meta-programação
    Miscelânea
    Ferramentas

Layout do código fonte

    Quase todo mundo está convencido que todos os estilos, exceto os seus são > feios e ilegíveis. Deixe de lado o "exceto seus próprios" e eles estarão provavelmente certo...
    -- Jerry Coffin (sobre recuo)

    Use UTF-8 como a codificação do arquivo de fonte.

    Use dois espaços por nível de recuo (conhecido como soft tabs). Nada de hard tabs.

    # ruim - quatro espaços
    def algum_metodo
        fazer_algo
    end

    # bom
    def algum_metodo
      fazer_algo
    end

    Use os finais de linha no estilo Unix. (* Usuários BSD/Solaris/Linux/OS X estão cobertos por padrão, usuários do Windows precisam ter cuidado extra).

    Se você estiver usando o Git, você pode querer adicionar a seguinte definição de configuração para proteger o seu projeto do aterrorizante end de linha do Windows:

$ git config --global core.autorcrlf true

    Não use ';' para separar as declarações e expressões. Como um corolário - use uma expressão por linha.

# ruim
puts 'foobar'; # ponto e vírgula supérfluo

puts 'foo'; puts 'bar' # duas expressões na mesma linha

# bom
puts 'foobar'

puts 'foo'
puts 'bar'

puts 'foo', 'bar' # isto aplica-se ao puts em particular

    Prefira um formato de linha único para as definições de classe sem corpo.

# ruim
class FooError < StandardError
end

# ok
class FooError < StandardError; end

# bom
FooError = Class.new(StandardError)

Evite os métodos de linha única. Embora sejam um tanto populares no mundo selvagem, existem algumas peculiaridades sobre a sintaxe de definição que torna seu uso indesejável. De qualquer forma - não deveria haver mais do que uma expressão em um método de linha única.

# ruim
def muito; alguma_coisa; alguma_outra_coisa; end

# ok - Observe que o primeiro ; é necessário
def metodo_sem_parenteses; corpo end

# ok - Observe que o segundo ; é opcional
def metodo_sem_parenteses; corpo; end

# okish - sintaxe válida, mas sem o ; é difícil de ler
def metodo() corpo end

# bom
def algum_metodo
  corpo
end

Uma exceção à regra são os métodos de corpo vazio.

# bom
def no_op; end

    Use espaços em torno de operadores, após vírgulas, dois-pontos e ponto e vírgula, em volta do { e antes do }. Espaço em branco pode ser (na maioria dos casos) irrelevante para o intérprete de Ruby, mas sua utilização correcta é a chave para escrever um código facilmente legível.

soma = 1 + 2
a, b = 1, 2
1 > 2 ? true : false; puts 'Olá'
[1, 2, 3].each { |e| puts e }

A única exceção, sobre os operadores, é o operador de expoente:

# ruim
e = M * c * * 2

# bom
e = M * c**2

{ e } merecem um pouco de esclarecimento, pois eles são usados para blocos e hashes literais, bem como expressões incorporadas em seqüências de caracteres. Para hash, dois estilos literais são considerados aceitáveis.

# bom - espaço após { e antes }
{ um: 1, dois: 2 }

# bom - sem espaço após { e antes }
{um: 1, dois: 2}

A primeira variante é ligeiramente mais legível (e sem dúvida mais popular na comunidade Ruby em geral). A segunda variante tem a vantagem de adicionar a diferença visual entre o bloco e hash literais. Qualquer um que você escolher - aplique-o de forma consistente.

Com as expressões incorporadas, há também duas opções aceitáveis:

# bom - sem espaços
"string #{expr}"

# ok - indiscutivelmente mais legível
"string #{ expr }"

O primeiro estilo é extremamente mais popular e é geralmente aconselhado a ficar com ele. O segundo, por outro lado, é (sem dúvidas) um pouco mais legível. Como com hashes - escolha um estilo e aplique-o de forma consistente.

    Sem espaços após (, [ ou antes ], ).

some(arg).other
[1, 2, 3].size

    Sem espaço após !.

# ruim
! algo

# bom
!algo

    Idente when no nível do case. Eu sei que muitos discordariam com isso, mas é o estilo estabelecido em ambos "The Ruby Programming Language" e "Programming Ruby".

# ruim
case
  when musica.nome == 'Misty'
    puts 'Não!'
  when musica.duracao > 120
    puts 'Muito tempo'!
  when Time.now.hour > 21
    puts "É tarde demais"
  else
    musica.Play
end

# bom
case
when musica.nome == 'Misty'
  puts 'Não!'
when musica.duracao > 120
  puts 'Muito tempo'!
when Time.now.hour > 21
  puts "É tarde demais"
else
  musica.play
end

    Quando você atribuir o resultado de uma expressão condicional a uma variável, preservar o alinhamento normal dos seus ramos.

# ruim - muito complicado
tipo = case ano
when 1850..1889 then 'Blues'
when 1890..1909 then 'Ragtime'
when 1910..1929 then 'New Orleans Jazz'
when 1930..1939 then 'Swing'
when 1940..1950 then 'Bebop'
else 'Jazz'
end

resultado = if condicao
  calc_algo
else
  calc_outro_algo
end

# bom - é evidente o que está acontecendo
tipo = case ano
       when 1850..1889 then 'Blues'
       when 1890..1909 then 'Ragtime'
       when 1910..1929 then 'New Orleans Jazz'
       when 1930..1939 then 'Swing'
       when 1940..1950 then 'Bebop'
       else 'Jazz'
       end

resultado = if condicao
              calc_algo
            else
              calc_outro_algo
            end


# bom (e um pouco mais largamente eficiente)
tipo =
  case ano
  when 1850..1889 then 'Blues'
  when 1890..1909 then 'Ragtime'
  when 1910..1929 then 'New Orleans Jazz'
  when 1930..1939 then 'Swing'
  when 1940..1950 then 'Bebop'
  else 'Jazz'
  end

resultado =
  if condicao
    calc_algo
  else
    calc_outro_algo
  end

    Usar linhas vazias entre as definições de método e também para quebrar um método em parágrafos de lógica internas.

def algum_metodo
  data = initialize(options)

  data.manipulate!

  data.result
end

def algum_metodo
  result
end

    Evitar a vírgula após o último parâmetro em uma chamada de método, especialmente quando os parâmetros não são em linhas separadas.

# ruim - mais fácil de mover ou adicionar/remover parâmetros, mas ainda não preferível
algum_metodo (
              tamanho,
              contagem,
              cor,
             )

# ruim
algum_metodo (tamanho, contagem, cor, )

# bom
algum_metodo (tamanho, contagem, cor)

    Use espaços em torno do operador = quando para atribuição de valores padrão para os parâmetros do método:

# ruim
def algum_metodo (arg1=:default, arg2=nil, arg3=[])
  # fazer alguma coisa...
end

# bom
def algum_metodo (arg1 =: default, arg2 = nil, arg3 = [])
  # fazer alguma coisa...
end

Enquanto diversos livros de Ruby sugerem o primeiro estilo, o segundo é muito mais proeminente na prática (e, possivelmente, um pouco mais legível).

Evitar a continuação da linha \ onde não é necessário. Na prática, evitar o uso de continuação da linha para nada além de concatenação de seqüência de caracteres.

# ruim
resultado = 1 - \
            2

# bom (mas ainda feio como o inferno)
resultado = 1 \
            - 2

long_string = 'Primeira parte da longa cadeia de caracteres' \
              'e a segunda parte da seqüência de caracteres longa'

    Adote um método consistente de estilo de encadeamento multi-linha. Existem dois estilos populares na comunidade Ruby, ambos dos quais são considerados bom - iniciando . (Opção A) e finalizando de . (Opção B).

    (Opção A) Quando continuando uma invocação de método encadeada em outra linha, mantenha o . na segunda linha.

# ruim - precisa consultar a primeira linha para entender a segunda linha
um.dois.tres.
  quatro

# bom - é imediatamente evidente o que está acontecendo a segunda linha
um.dois.tres
  .quatro

    (Opção B) quando continuando uma invocação de método encadeada na outra linha, incluir o . na primeira linha para indicar que a expressão continua.

# ruim - precisa ler em frente para a segunda linha de saber que a corrente continua
um.dois.tres
  .quatro

# bom - é imediatamente evidente que a expressão continua além da primeira linha
um.dois.tres.
  quatro

Uma discussão sobre os méritos de ambos os estilos alternativos pode ser encontrada aqui.

    Alinhar os parâmetros de um método chamado se eles se espalham por mais de um linha. Quando alinhar parâmetros não é apropriado devido à restrições de comprimento da linha, identação única para as linhas após a primeira é também aceitável.

# ponto de início (a linha é muito longa)
def enviar_email(source)
  Mailer.deliver(to: 'bob@example.com,' from: 'us@example.com', subject: 'Mensagem importante', body: source.text)
end

# ruim (dupla identação)
def send_mail(source)
  Mailer.deliver(
      to: 'bob@example.com',
      from: 'us@example.com',
      subject: 'Mensagem importante',
      body: source.text)
end

# bom
def send_mail(source)
  Mailer.deliver(to: 'bob@example.com',
                 from: 'us@example.com',
                 subject: 'Mensagem importante',
                 body: source.text)
end

# bom (identação única)
def send_mail(source)
  Mailer.deliver(
    to: 'bob@example.com',
    from: 'us@example.com',
    subject: 'Mensagem importante',
    body: source.text
  )
end

    Alinhe os elementos do array de literais, abrangendo várias linhas.

# ruim - identação única
menu_item = ['Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam',
  'Feijão', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam']

# bom
menu_item = [
  'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam',
  'Feijão', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam'
]

# bom
menu_item =
  ['Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam',
   'Feijão', 'Spam', 'Spam', 'Spam', 'Spam', 'Spam']

    Adicione sublinhados para literais numéricos grandes para melhorar a sua legibilidade.

# ruim - quantos 0s existem?
num = 1000000

# bom - muito mais fácil de analisar para o cérebro humano
num = 1_000_000

    Use RDoc e suas convenções para a documentação da API. Não coloque uma linha vazia entre o bloco de comentários e o def.

    Limitar as linhas à 80 caracteres.

    Evite o espaço em branco à direita.

    Termine cada arquivo com uma nova linha.

    Não use comentários em bloco. Eles não podem ser precedidos por um espaço em branco e não são tão fácil de identificar como os comentários regulares.

# mau
=begin
linha de comentário
outra linha de comentário
=end

# bom
# linha de comentário
# outra linha de comentário

Sintaxe

    Use :: apenas para referências constantes (isso inclui as classes e módulos) e construtores (como Array() ou Nokogiri::HTML()). Nunca use :: para invocação de método regular.

# mau
AlgumaCasse::algum_metodo
algum_objeto::algum_metodo

# bom
AlgumaClasse.algum_metodo
algum_objeto.algum_metodo
AlgumModulo::AlgumaClasse::SOME_CONST
AlgumModulo::AlgumaClasse()

    Use def com parênteses, quando há argumentos. 
    Omita os parênteses quando o método não aceita quaisquer argumentos.

# mau
def algum_metodo()
  # corpo omitido
end

# bom
def algum_metodo
  # corpo omitido
end

# mau
def algum_metodo_com_argumentos arg1, arg2
  # corpo omitido
end

# bom
def algum_metodo_com_argumentos(arg1, arg2)
  #corpo omitido
end

    Nunca use for, à menos que você saiba exatamente o porquê. 
    A maioria dos iteradores de vezes devem ser usado em vez disso. 
    for é implementado em termos de each (assim você está adicionando um nível de indireção), 
    mas com uma reviravolta - for não introduz um novo escopo (ao contrário de each) 
    e as variáveis definidas em seu bloco serão visíveis fora dela.

arr = [1, 2, 3]

# mau
for elem in arr do
  puts elem
end

# note que elem é acessível de fora do loop for
elem #=> 3

# bom
arr.each { |elem| puts elem }

# elem não é acessível fora do cada bloco
elem #=> NameError: undefined local variable or method 'elem'

    Nunca use then para multi-linhas if/unless.

# mau
if alguma_condicao then
  # corpo omitido
end

# bom
if alguma_condicao
  # corpo omitido
end

    Sempre colocar a condição na mesma linha que o if / unless em uma condicional de várias linha.

# mau
if
  alguma_condicao
  faca_alguma_coisa
  faca_alguma_outra_coisa
end

# bom
if alguma_condicao
  faca_alguma_coisa
  faca_alguma_outra_coisa
end

    Favoreça o operador ternário (?:) sobre construções de if/then/else/end. É obviamente mais conciso e mais comum.

# mau
resultado = if alguma_condicao then alguma_coisa else outra_coisa end

# bom
resultado = alguma_condicao ? alguma_coisa : outra_coisa

    Use uma expressão por ramo em um operador ternário. Isto também significa que os operadores ternários não devem ser aninhados. Prefira construtores if/else nesses casos.

# mau
alguma_condicao ? (condicao_aninhada ? alguma_coisa_aninhada : outra_coisa_aninhada) : outra_coisa

# bom
if alguma_condicao
  condicao_aninhada ? alguma_coisa_aninhada : outra_coisa_aninhada
else
  outra_coisa
end

    Nunca use if x: ... - a partir de Ruby 1.9, ele foi removido. Use o operador ternário em vez disso.

# mau
resultado = if alguma_condicao : alguma_coisa else outra_coisa end

# bom
resultado = alguma_condicao ? alguma_coisa : outra_coisa

    Nunca use if x; .... Use o operador ternário.

    Aproveitar o fato de que, if e case são expressões que retornam um resultado.

# mau
if condicao
  resultado = x
else
  resultado = y
end

# bom
resultado =
  if condicao
    x
  else
    y
  end

    Use when x then ... para os casos de uma linha. A sintaxe alternativa when x: ... foi removido a partir do Ruby 1.9.

    Nunca use when x; .... Consulte a regra anterior.

    Use ! em vez de not.

# mau - chaves são necessárias por causa da precedência de operadores
x = (not algo)

# bom
x = !algo

Evitar a utilização de !!.

# mau
x = 'teste'
# obscura checagem de nil
if !!x
  # corpo omitido
end

x = false
# dupla negação é inútil em booleanos
!!x # => false

# bom
x = 'teste'
unless x.nil?
  # corpo omitido
end

    As palavras-chave and e or são proibidas. Não valem a pena. Sempre use && e || em vez disso.

# mau
# expressão booleana
if alguma_condicao and alguma_outra_condicao
  faca_alguma_coisa
end

# controle de fluxo
document.saved? or document.save!

# bom
# expressão booleana
if alguma_condicao && alguma_outra_condicao
  faca_alguma_coisa
end

# controle de fluxo
document.saved? || document.save!

Evitar a multi-linha ?: (o operador ternário); Use if/unless.

    Favorite o uso do modificador if/unless quando você tem um corpo de linha única. Outra boa alternativa é o uso de fluxo de controle &&/||.

# mau
if alguma_condicao
  faca_alguma_coisa
end

# bom
faca_alguma_coisa if alguma_condicao

# outra boa opção
alguma_condicao && faca_alguma_coisa

    Favorecer unless sobre if para negativo condições (ou controle fluxo ||).

# mau
faca_alguma_coisa if !alguma_condicao

# mau
faca_alguma_coisa if not alguma_condicao

# bom
faca_alguma_coisa unless alguma_condicao

# outra boa opção
alguma_condicao || faca_alguma_coisa

    Nunca use unless com else. Reescreva estas com o caso positivo primeiro.

# mau
unless sucesso?
  puts 'fracasso'
else
  puts 'sucesso'
end

# bom
if sucesso?
  puts 'sucesso'
else
  puts 'fracasso'
end

    Não use parênteses em torno da condição de uma if/unless/while/until.

# mau
if (x > 10)
  # corpo omitido
end

# bom
if x > 10
  # corpo omitido
end

    Nunca utilize while/until condição do para a multi-linha while/until.

# mau
while x > 5 do
  # corpo omitido
end

until x > 5 do
  # corpo omitido
end

# bom
while x > 5
  # corpo omitido
end

until x > 5
  # corpo omitido
end

    Favoreça o uso do modificador while/until quando você tem uma linha única.

# mau
while alguma_condicao
  faca_alguma_coisa
end

# bom
faca_alguma_coisa while alguma_condicao

    Favoreça until sobre o while para condições negativas.

# mau
faca_alguma_coisa while !alguma_condicao

# bom
faca_alguma_coisa until alguma_condicao

    Use Kernel#loop com break ao invés de begin/end/until ou begin/end/while para testes pós-loop.

# mau
being
  puts val
  val += 1
end while val < 0

# bom
loop do
  puts val
  val += 1
  break unless val < 0
end

    Omitir parênteses em torno de parâmetros para métodos que fazem parte de uma DSL interna (por exemplo, Rake, Rails, RSpec), métodos que têm status de "palavra-chave" em Ruby (por exemplo, attr_reader, puts) e o métodos de acesso de atributos. Use parênteses em torno dos argumentos de todas as outras invocações de método.

class Pessoa
  attr_reader :nome, :idade

  # omitido
end

temperanca = Pessoa.new('Temperança', 30)
temperanca.nome

puts temperanca.idade

x = Math.sin(y)
array.delete(e)

boliche.score.should == 0

    Omita o aparelho exterior em torno de um hash de opções implícita.

# mau
Usuario.set({nome: 'John', idade: 45, permissoes: {leitura: true}})

# bom
Usuario.set(nome: 'John', idade: 45, permissoes: {leitura: true})

    Omitir ambas as chaves e parênteses exteriores para métodos que são parte de uma DSL interna.

class Pessoa < ActiveRecord::Base
  # mau
  validates(:nome, { presence: true, length: { within: 1..10 } })

  # bom
  validates :nome, presence: true, length: { within: 1..10 }
end

    Omita parênteses para chamadas de método sem argumentos.

# mau
Kernel.exit!()
2.even?()
fork()
'test'.upcase()

# bom
Kernel.exit!
2.even?
fork
'teste'.upcase

    Prefira {...} ao invés de do..end para blocos de linha única. Evite o uso de {...} para a linha multi blocos (encadeamento de várias linhas é sempre feio). Use sempre do..end para "fluxo de controle" e "definições de métodos" (por exemplo, em Rakefiles e certos DSLs). Evite o do..end quando encadeando.

nomes = ['Bozhidar', 'Steve', 'Sarah']

# mau
nomes.each |nome|
  puts nome
end

# bom
nomes.each { |nome| puts nome }

# mau
nomes.select |nome|
  nome.start_with?('S')
end.map { |nome| nome.upcase }

# bom
nomes.select { |nome| nome.start_with?('S') }.map { |nome| nome.upcase }

Alguns argumentam que o encadeamento de várias linhas ficaria bem com o uso de {...}, mas eles devem se perguntar - é esse código realmente legível e podem ser extraídos os conteúdos dos blocos em métodos estilosos?

    Considere usar argumento explícito de nomes para evitar a escrita de bloco literal que só passa seus argumentos para outro bloco. Cuidado com os impactos no desempenho, assim que, os blocos são convertidos para um Proc.

require 'tempfile'

# mau
def com_dir_tmp
  Dir.mktmpdir do |dir_tmp|
    Dir.chdir(dir_tmp) { |dir| yield dir } # bloco só passa argumentos
  end
end

# bom
def com_dir_tmp(&block)
  Dir.mktmpdir do |dir_tmp|
    Dir.chdir(dir_tmp, &block)
  end
end

com_dir_tmp do |dir|
  puts "dir é acessível como um parâmetro e pwd é definido: #{dir}"
end

    Evite return, onde não é necessário para o fluxo de controle.

# mau
def algum_metodo(algum_array)
  return algum_array.size
end

# bom
def algum_metodo(algum_array)
  algum_array.size
end

    Evitar self onde não é necessário. (Só é necessário ao chamar um acessador de auto gravação.)

# bad
def pronto?
  if self.revisado_em > self.atualizado_em
    self.trabalhador.update(self.contudo, self.opcoes)
    self.status = :em_progresso
  end
  self.status == :verificado
end

# good
def pronto?
  if revisado_em > atualizado_em
    trabalhador.update(contudo, opcoes)
    self.status = :em_progresso
  end
  status == :verificado
end