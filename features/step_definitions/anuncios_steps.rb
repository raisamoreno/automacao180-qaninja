Dado('Login com {string} e {string}') do |email, senha|                     
    @email = email  

    @login_page.open_page
    @login_page.with(email, senha)
end                                                                            

  
Dado('que acesso o formulário de cadastro de Anúncios') do

    @dash_page.goto_equipamentosform
end

Dado('que eu tenho o seguinte equipamento:') do |equipamento|

   @anuncio = equipamento.rows_hash
   
   MongoDB.new.remove_anuncio(@anuncio[:nome], @email)
end
  
Quando('submeto o cadastro desse item') do
    @equipamentos_page.create_equipamento(@anuncio)

end
  
Então('devo ver esse item no meu Dashboard') do
    expect(@dash_page.equipamento_list).to have_content @anuncio[:nome]
    expect(@dash_page.equipamento_list).to have_content "R$#{@anuncio[:preco]}/dia"
end

Então('deve conter a mensagem de alerta: {string}') do |expect_alert|
    expect(@alert.alert_dark).to have_text expect_alert
end