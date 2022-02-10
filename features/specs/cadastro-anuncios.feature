#language: pt

Funcionalidade: Cadastro de Anúncios
    Sendo um usuário cadastrado no RockLov que possui equipamentos musicais
    Quero cadastrar meus equipamentos
    Para que eu possa disponibilizá-los para locação


    Cenario: Novo equipamento


        Dado que estou logado como "betao@yahoo.com" e "pwd123"
            E que acesso o formulário de cadastro de Anúncios
            E que eu tenho o seguinte equipamento:
            | imagem    | fender-sb.jpg |
            | nome      | Fender Strato |
            | categoria | Cordas        |
            | preco     | 200           |

        Quando submeto o cadastro desse item
        Então devo ver esse item no meu Dashboard
