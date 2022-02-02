Então('sou redirecionado para o Dashboard') do                                 
    expect(page).to have_css ".dashboard"
end       

Então('vejo a mensagem de alerta: {string}') do |expected_alert|
    alerta_mensagem = find(".alert-dark")
    expect(alerta_mensagem.text).to eql expected_alert
end