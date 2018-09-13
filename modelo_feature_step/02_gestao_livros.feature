# language: pt

Funcionalidade: Gestão de Livros
	  O livro deve ter apenas um campo obrigatório  
	  Título e vários campos opcionais: autor, páginas, descrição

	Cenario: Criar novo livro
		Quando eu preencher o formulário do novo livro com dados válidos
		Em seguida, o livro deve ser adicionado ao banco de dados
		E eu deveria vê-lo na página da biblioteca

	Cenario: Tentar criar um livro com título vazio
		Quando eu preencher o novo formulário do livro com título vazio
		Em seguida, o livro não deve ser adicionado ao banco de dados
		E eu deveria ver o novo formulário de livro com mensagem de erro

	Cenario: Mostrar Informações do livro
		Dado o livro "The Hamlet" existe
		Quando eu vou para a página do livro "The Hamlet"
		Então eu deveria ver "The Hamlet" detalhes do livro
		E eu deveria ver "The Hamlet" livro editar link

	Cenario: Tentar ver os detalhes do livro inxistente
		Quando eu vou para a página do livro inexistente
		Então eu deveria ser redirecionado para a página da biblioteca
		E eu deveria ver "Livro não existe" mensagem de erro

	Cenario: Editar livro existente
		Dado o livro "The Hamlet" existe
		Quando eu mudar o título do livro para "Romeu e Julieta"
		Então o livro "The Hamlet" não deveria existir no banco de dados
		E o livro "Romeu e Julieta" deve existir no banco de dados
		E eu deveria ver o livro "Romeu e Julieta" na página da biblioteca

	Cenario: Deletar Livro
		Dado o livro "The Hamlet" existe
		Quando eu excluí-lo
		Então o livro "The Hamlet" não deveria existir no banco de dados
		E eu não deveria ver o livro "The Hamlet" na página da biblioteca
