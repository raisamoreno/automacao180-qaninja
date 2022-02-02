#language: pt
Funcionalidade: Login
    Sendo um usuário cadastrado
    Quero acessar o sistema da RockLov
    Para que eu possa anunciar meus equipamentos musicais

    @login
    Cenario: Login do usuário

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "viviane@gmail.com" e "vivi123"
        Então sou redirecionado para o Dashboard


    @tentativa
    Esquema do Cenario: Tentativa de Login

        Dado que acesso a página principal
        Quando submeto minhas credenciais com "<email_input>" e "<senha_input>"
        Então vejo a mensagem de alerta: "<mensagem_output>"


        Exemplos:
            | email_input      | senha_input  | mensagem_output                  |
            | raisa@gmail.com  | batatinha123 | Usuário e/ou senha inválidos.    |
            | marina@yahoo.com | pwd123       | Usuário e/ou senha inválidos.    |
            | raisa#gmail.com  | pwd123       | Oops. Informe um email válido!   |
            |                  | pwd123       | Oops. Informe um email válido!   |
            | raisa@gmail.com  |              | Oops. Informe sua senha secreta! |