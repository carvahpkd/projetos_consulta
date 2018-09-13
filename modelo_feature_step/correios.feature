# language: pt

Funcionalidade: Exibir dados referente a um CEP válido
	Como um usuário
	Eu quero buscar informações complementares de um CEP válido
	Usando a API dos Correios
	Para que eu veja as informações complementares do CEP informado

	Cenario: Dados extras de um CEP válido
		Dado a página "http://cep.correiocontrol.com.br/<CEP>.json" estar aberta
		Onde para a variável <CEP> será atribuída um CEP válido (13255718)
		Será exibido dados complementares do CEP ({"bairro": "Loteamento Itatiba Park", "logradouro": "Rua Guilhermino Pereira", "cep": "13255718", "uf": "SP", "localidade": "Itatiba"})

Funcionalidade: Exibir mensagem de erro para um CEP inválido
	Como um usuário
	Eu quero verificar se é retornada uma mensagem de erro para CEPs inválidos
	Usando a API dos Correios
	Para que certificar que há tratamento de CEPs na API

	Cenario: Mensagem de erro para CEP inválido
		Dado a página "http://cep.correiocontrol.com.br/<CEP>.json" estar aberta
		Onde para a variável <CEP> será atribuída um CEP inválido (02358987)
		Será exibida a mensagem de erro (correiocontrolcep({"erro":true});)

	Cenario: Mensagem de erro para padrão inválido de formato de CEP com menos dígitos
		Dado a página "http://cep.correiocontrol.com.br/<CEP>.json" estar aberta
		Onde para a variável <CEP> será atribuída um CEP com menos de 8 dígitos (01528)
		Será exibida a mensagem de erro (correiocontrolcep({"erro":true});)

	Cenario: Mensagem de erro para padrão inválido de formato de CEP com letras
		Dado a página "http://cep.correiocontrol.com.br/<CEP>.json" estar aberta
		Onde para a variável <CEP> será atribuída um CEP com menos de 8 dígitos (0a15b187)
		Será exibida a mensagem de erro (correiocontrolcep({"erro":true});)

	Cenario: Mensagem de erro para padrão inválido de formato de CEP com hífen
		Dado a página "http://cep.correiocontrol.com.br/<CEP>.json" estar aberta
		Onde para a variável <CEP> será atribuída um CEP com menos de 8 dígitos (01528-010)
		Será exibida a mensagem de erro (correiocontrolcep({"erro":true});)

	Cenario: Mensagem de erro para CEP em branco
		Dado a página "http://cep.correiocontrol.com.br/<CEP>.json" estar aberta
		Onde para a variável <CEP> não será atribuída um CEP
		Será exibida a mensagem de erro (correiocontrolcep({"erro":true});)
