#language: pt

Funcionalidade: Menu de Cima

	Em qualquer página usuário do aplicativo deve ver o menu com links.
	Usuário visitante vê links para Formulário de inscrição e Login
	O leitor vê seu e-mail, link de Conta e logout
	Admin vê a mesma coisa que o leitor faz, mas também o link para admin painel.

	Cenario: Usuario Convidado
		Dado que sou um convidado
		Quando eu ir para a página inicial
		Então eu devo ver o menu do convidado

	Cenario: Leitor
		Dado que sou um leitor de "john@reader.com"
		Quando vou para a pagina inicial
		Então eu deveria ver "john@reader.com" menu do leitor
