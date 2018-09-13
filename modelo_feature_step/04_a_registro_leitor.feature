#language: pt

Funcionalidade: Registro do Leitor

	Cenario: Registro do leitor com sucesso através do formulário de registro
		Dado que sou um convidado
		Quando eu preencher o formulário de registro com dados válidos
		Então eu deveria estar registrado na aplicação
		E eu deveria estar logado

	Cenario: O leitor tenta registar dados inválidos
		Dado que sou um convidado
		Quando eu preencher o formulário de registro com dados inválidos
		Então eu deveria ver o formulário de registro novamente
		E eu não deveria estar registrado no aplicativo
