require 'mongo'

Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDB

    attr_accessor :usuarios, :ssequipamentos

    def initialize
        database = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
        @collection_users = database[:users]
        @collection_equipamentos = database[:equipos]
    end

    def remove_user(email)
        @collection_users.delete_many({email: email})
    end

    def get_user(email)
        user = @collection_users.find({email: email}).first
        return user[:_id]
    end

    def remove_anuncio(nome, email)
        user_id = get_user(email)
        @collection_equipamentos.delete_many({name: nome, user: user_id})
    end
end
