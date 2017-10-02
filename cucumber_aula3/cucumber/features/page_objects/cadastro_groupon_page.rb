class CadastroGroupon < SitePrism::Page
  element :primeiro_nome,       "#first-name-input"
  element :sobrenome,           :xpath, '//input[@name="last_name"]'
  element :cpf,                 "#personal-identifier-input"
  element :rua,                 "#street-input"
  element :numero_casa,         "#street-number-input"
  element :cep,                 "#postal-code-input"
  element :cidade,              "#city-input"
  element :email,               "#email-input"
  element :telefone_opcional,   "#phone-number-input"
  element :senha,               "#password-input"
  element :confirmar_senha,     "#password-confirmation-input"
  element :genero,              "#gender-select"
  element :botao_cadastrar,     :xpath, '//input[@name="submit"]'
end
