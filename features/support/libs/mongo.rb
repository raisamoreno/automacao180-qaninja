require 'mongo'

Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDB

    def remove_user(email)
        database = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
        collection_users = database[:users]
        delete_email = collection_users.delete_many({ email: "fernando@bol.com"})
    end

    def get_user(email)
        database = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
        collection_users = database[:users]
        user = collection_users.find({email: email}).first
        return user[:_id]
    end

    def remove_anuncio(nome, email)
        user_id = get_user(email)
        database = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
        collection_equipamentos = database[:equipos]
        collection_equipamentos.delete_many({name: nome, user: user_id })
    end
end
