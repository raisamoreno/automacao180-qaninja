class EquipamentosPage

    include Capybara::DSL

    def create_equipamento(equipamento)
        #expect(page).to have_css "#equipoForm"
        #não se pode usar expect dentro de um page object. Logo, será substituido por um 'has_css?' (que no caso é um checkpoint com timeout explícito).
       #a interrogação retorna 'true' ou 'false'
       page.has_css?("#equipoForm")

        upload(equipamento[:imagem]) if equipamento[:imagem].length > 0
       
        find("input[placeholder$=equipamento]").set equipamento[:nome]
        select_category(equipamento[:categoria]) if equipamento[:categoria].length > 0
        find("input[placeholder^=Valor]").set equipamento[:preco]
   
       click_button "Cadastrar"
    end
    

    def upload(nome_arquivo)
        imagem = Dir.pwd + "/features/support/fixtures/images/" + nome_arquivo
        find("#thumbnail input[type=file]", visible: false).set imagem
    end

    def select_category(categoria)
        find("#category").find('option', text: categoria).select_option
    end

end