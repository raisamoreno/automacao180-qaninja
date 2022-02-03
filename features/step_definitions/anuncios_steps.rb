Dado('que estou logado como {string} e {string}') do |email, senha|

    visit "/"
    find("input[placeholder='Seu e-email'").set email
    find("input[type=password]").set senha

    click_button "Entrar"
end
  
Dado('que acesso o formulário de cadastro de Anúncios') do

    click_button "Criar anúncio"
    expect(page).to have_css "#equipoForm"
end

Dado('que eu tenho o seguinte equipamento:') do |equipamento|

   @anuncio = equipamento.rows_hash
end
  
Quando('submento o cadastro desse item') do

    find("input[placeholder$=equipamento]").set @anuncio[:nome]
    find("#category").find('option', text: @anuncio[:categoria]).select_option
    find("input[placeholder^=Valor]").set @anuncio[:preco]

    click_button "Cadastrar"
end
  
Então('devo ver esse item no meu Dashboard') do
    pending # Write code here that turns the phrase above into concrete actions
end