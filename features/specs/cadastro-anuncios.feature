#language: pt

Funcionalidade: Cadastro de Anúncios
    Sendo um usuário cadastrado no RockLov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibilizá-los para locação

    Contexto: Login
        * Login com "betao@yahoo.com" e "pwd123"

    Cenario: Novo equipamento


        Dado que acesso o formulário de cadastro de Anúncios
            E que eu tenho o seguinte equipamento:
            | imagem    | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |

        Quando submeto o cadastro desse item



    @tentativa_cadanuncio
    Esquema do Cenario: Tentativa de cadastro de anúncios


        Dado que acesso o formulário de cadastro de Anúncios
            E que eu tenho o seguinte equipamento:
            | imagem    | <foto>      |
            | nome      | <nome>      |
            | categoria | <categoria> |
            | preco     | <preco>     |

        Quando submeto o cadastro desse item
        Então deve conter a mensagem de alerta: "<saida>"

        Exemplos:
            | foto          | nome              | categoria | preco | saida                                |
            |               | Violão de Nylon   | Cordas    | 150   | Adicione uma foto no seu anúncio!    |
            | clarinete.jpg |                   | Outros    | 250   | Informe a descrição do anúncio!      |
            | mic.jpg       | Microfone Shure   |           | 100   | Informe a categoria                  |
            | trompete.jpg  | Trompete Clássico | Outros    |       | Informe o valor da diária            |
            | conga.jpg     | Conga             | Outros    | abc   | O valor da diária deve ser numérico! |
            | conga.jpg     | Conga             | Outros    | 100a  | O valor da diária deve ser numérico! |