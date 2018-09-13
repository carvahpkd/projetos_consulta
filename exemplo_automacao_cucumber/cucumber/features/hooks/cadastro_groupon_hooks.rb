Before '@general' do
  @cadastro_groupon =   CadastroGroupon.new
  @primeiro_nome =      Faker::LordOfTheRings.character
  @sobrenome =          Faker::LordOfTheRings.character
  @cpf =                Faker::CPF.numeric
  @rua =                Faker::Address.street_name
  @numero_casa =        Faker::Base.numerify("###")
  @cep =                "05433001"
  @cidade =             Faker::LordOfTheRings.location
  @email =              Faker::Internet.email
  @telefone_opcional =  Faker::Base.numerify("119#######")
  @senha =              Faker::Base.numerify("inicial######")
  @genero =             "Sr."
   
  puts 'O email utilizado é ' + @email
  puts 'A senha utilizada é ' + @senha
end