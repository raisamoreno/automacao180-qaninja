class LoginPage

    include Capybara::DSL

    def open_page
        visit "/"
    end
    
    def with(email, senha)
        find("input[placeholder='Seu email'").set email
        find("input[type=password]").set senha
        click_button "Entrar"
    end

end
