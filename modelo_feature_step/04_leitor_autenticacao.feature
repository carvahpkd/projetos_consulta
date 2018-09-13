#language: pt

Funcionalidade: Autenticação

	Cenario: Login do leitor bem sucedido
		Dado que sou um convidado
		E o leitor com "bob@reader.com" existe
		Quando eu preencher o formulário de login com dados válidos para "bob@reader.com" leitor
		Então eu deveria estar logado como "bob@reader.com" reader
	
	Cenario: Deslogar
		Dado que sou um leitor de "reader01@email.com"
		Quando eu ir para a página de logout
		Então eu devo ser desconectado
