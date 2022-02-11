Dado('que estou logado como {string} e {string}') do |email, senha|
    @email = email

   @login_page.open_page
   @login_page.with(email, senha)
end
  
Dado('que acesso o formulário de cadastro de Anúncios') do

    click_button "Criar anúncio"
    expect(page).to have_css "#equipoForm"
end

Dado('que eu tenho o seguinte equipamento:') do |equipamento|

   @anuncio = equipamento.rows_hash
   
   MongoDB.new.remove_anuncio(@anuncio[:nome], @email)
end
  
Quando('submeto o cadastro desse item') do

   imagem = Dir.pwd + "/features/support/fixtures/images/" + @anuncio[:imagem]

    find("#thumbnail input[type=file]", visible: false).set imagem
    find("input[placeholder$=equipamento]").set @anuncio[:nome]
    find("#category").find('option', text: @anuncio[:categoria]).select_option
    find("input[placeholder^=Valor]").set @anuncio[:preco]

    click_button "Cadastrar"
end
  
Então('devo ver esse item no meu Dashboard') do

    anuncios = find(".equipo-list")
    expect(anuncios).to have_content @anuncio[:nome]
    expect(anuncios).to have_content "R$#{@anuncio[:preco]}/dia"
end