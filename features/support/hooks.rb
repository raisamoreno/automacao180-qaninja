#Arquivo destinado a ganchos (hooks).Hooks nada mais é do que um gatilho que vai te ajudar no começo e no fim de um cenário. Com ele, é possível realizar um setup do cenário e uma ação no fim, como por exemplo limpar o cache do browser após o término do cenário.


#Neste caso, estamos instanciando o objeto LoginPage neste arquivo para que ele não precise ser instanciado nos demais. Basta usar a variávellogin_page precedida de um @.
Before do
    @alert = Alert.new
    @login_page = LoginPage.new
    @signup_page = SignupPage.new
end 