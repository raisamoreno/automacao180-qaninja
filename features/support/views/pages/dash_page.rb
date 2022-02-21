# não se pode colocar expected em page objects

class DashPage

    include Capybara::DSL

    def on_dash?
        page.has_css?(".dashboard")
    end    

    def goto_equipamentosform
        click_button "Criar anúncio"
    end

    def equipamento_list
        return find(".equipo-list")  
    end
    
end