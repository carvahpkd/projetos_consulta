# language: pt

Funcionalidade: Buscar produtos em estoque
	Como um usuário
	Eu quero buscar em um site específico
	Para que eu veja resultados de estoque

	Cenario: Exibir resultados
		Dado a página "http://www.walmart.com.br" estar aberta
		Quando eu procurar por "tv"
		Então deverá ser exibida uma lista de produtos cuja descrição contenha a palavra "tv"
		E verificar que pelo menos um registro tenha sido exibido buscando pela palavra "tv"

	Cenario: Acessar a página de um item exibido do estoque
		Dado a busca por "tv" executada
		Quando clicar em um dos itens exibidos pelo resultado da busca
		Então deverá ser exibida a página com informações sobre o item clicado
		
	Cenario: Adicionar item ao carrinho
		Dado a exibição da página com as informações do item de estoque escolhido
		Quando clicar no botão "Adicionar ao carrinho"
		Então deverá ser contabilizado a quantidade do item escolhido igual a 1
		E deverá ser subtraído 1 item do mesmo produto do estoque
		E deverá ser mostrado o valor a ser pago pelo item adicionado

	Cenario: Verificar que o item escolhido esteja no carrinho
		Dado a inclusão de um item de produtos do estoque ao carrinho
		Quando clicar no botão "Abrir carrinho"
		Então deverá exibido a lista de itens adicionados ao carrinho, neste caso 1 item do produto "tv"