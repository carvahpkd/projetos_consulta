Given /^Eu sou um convidado$/ do
end

When /^Preencho o formulário de registro com dados válidos$/ do
	visit "/register" 
	fill_in "reader_email", with: "reader01@mail.com"
	fill_in "reader_password", with: "pass"
	fill_in "reader_password_confirmation", with: "pass"
	click_button "Register"
end

Then /^Eu deveria estar registrado no aplicativo$/ do
	expect(Reader.find_by_email("reader01@mail.com")).not_to be_nil
end

When /^Preenchimento do formulário de registro com dados inválidos$/ do
	visit "/register"
	fill_in "reader_email", with: "reader"
	fill_in "reader_password", with: "pass"
	fill_in "reader_password_confirmation", with: "pass"
	click_button "Register"
end

Then /^Deveria ver o formulário de registro novamente$/ do
	expect(page).to have_selector('form#new_reader')
end

Then /^Eu não deveria estar registrado no aplicativo$/ do
	expect(Reader.find_by_email('reader')).to be_nil
end

Then /^Eu deveria estar logado$/ do
	expect(page).to have_content("Welcome, reader01@mail.com")
end

When /^Vou para a home page$/ do
	visit root_url
end

Then /^Eu deveria ver o menu do convidado$/ do
	expect(page).to have_selector("#top-menu")
	expect(page).to have_link('Register', href: register_path)
end

Given /^Eu sou um "(. *?)" Leitor$/ do |email|
	step "reader with \"#{email}\" exists"
	step "I fill the login form with valid data for \"#{email}\" reader"
end

When /^Vou para a home page$/ do 
	visit root_url
end

Then /^Eu deveria ver "(. *?)" Menu do leitor$/ do |email|
	expect(page).to have_content("Welcome, #{email}")
end

Given /^Leitor com "(. *?)" Existe$/ do |email|
	Reader.create(email: email, password: "pass", password_confirmation: "pass")
end

When /^Preencho o formulário de login com dados válidos para o leitor "(. *?)"$/ do |email|
	visit '/login'
	fill_in 'login_email', with: email
	fill_in 'login_password', with: 'pass'
	click_button 'Login'
end

Then /^Eu deveria estar logado como "(. *?)" leitor$/ do |email|
	expect(page).to have_content "Welcome, #{email}"
end

When /^Vou para a página de logout$/ do
	visit '/logout'
end

Then /^Eu devo ser desconectado$/ do
	expect(page).not_to have_content('Welcome')
	expect(page).to have_content('Register')
end
