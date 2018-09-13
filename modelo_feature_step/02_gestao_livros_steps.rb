When /^Preencho o formulário do novo livro com dados válidos$/ do
  visit new_book_url
  fill_in "book_title", with: "The Hamlet"
  fill_in "book_pages", with: "150"
  fill_in "book_author", with: "William Shakespeare"
  fill_in "book_description", with: "Excellent play"
  click_button "Create"
end

Then /^O livro deve ser adicionado ao banco de dados$/ do
  expect(Book.find_by_title("The Hamlet")).not_to be_nil
end

Then /^Eu deveria vê-lo na página da biblioteca$/ do
  expect(page).to have_content("The Hamlet")
end

When /^Preencho o novo formulário do livro com o título vazio$/ do
  visit new_book_url
  click_button "Create"
end

Then /^O livro não deve ser adicionado ao banco de dados$/ do
  expect(Book.count).to eq 0
end

Then /^Eu deveria ver o novo formulário de livro com mensagem de erro$/ do
  expect(page).to have_selector("form#new_book")
  expect(page).to have_selector(".alert-error")
end

Given /^Livro "(. *?)" Existe$/ do |title|
  @book = Book.create(id: 1, title: title)
end

When /^Vou para a página do livro "(. *?)"$/ do |title|
  visit book_url(@book)
end

Then /^Eu deveria ver "(. *?)" Detalhes do livro$/ do |title|
  expect(page).to have_content(title)
end

Then /^Eu deveria ver "(. *?)" Link de edição do livro$/ do |arg1|
  expect(page).to have_link("Edit", href: edit_book_path(@book))
end

When /^Vou para a página do livro inexistente$/ do
  visit '/books/0'
end

Then /^Eu deveria ser redirecionado para a página da biblioteca$/ do
  expect(current_path).to eq root_path
end

Then /^Eu deveria ver "(. *?)" Mensagem de erro$/ do |message|
  expect(page).to have_content(message)
end

When /^Eu mudo o título do livro para "(.*?)"$/ do |title|
  visit edit_book_path(@book)
  fill_in "book_title", with: title
  click_button "Update"
end

Then /^livro "(.*?)" não deve existir no banco de dados$/ do |title|
  expect(Book.find_by_title(title)).to be_false
end

Then /^livro "(.*?)" deve existir no banco de dados$/ do |title|
  expect(Book.find_by_title(title)).not_to be_nil
end

Then /^Eu deveria ver "(. *?)" Livro na página da biblioteca$/ do |title|
  expect(page).to have_content(title)
end

When /^eu excluir$/ do
  visit edit_book_path(@book)
  click_on "Delete"
end

Then /^Eu não deveria ver "(. *?)" Livro na página da biblioteca$/ do |title|
  expect(page).not_to have_content(title)
end
