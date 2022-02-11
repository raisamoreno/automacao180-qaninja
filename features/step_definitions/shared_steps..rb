Então('sou redirecionado para o Dashboard') do                                 
    expect(page).to have_css ".dashboard"
end       

Então('vejo a mensagem de alerta: {string}') do |expected_alert|
    expect(@alert.alert_dark).to eql expected_alert
end