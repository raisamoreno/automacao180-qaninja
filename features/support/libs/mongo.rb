require 'mongo'

Mongo::Logger.logger = Logger.new("./logs/mongo.log")

class MongoDB

    def remove_user(email)
        database = Mongo::Client.new('mongodb://rocklov-db:27017/rocklov')
        collection_users = database[:users]
        delete_email = collection_users.delete_many({ email: "fernando@bol.com"})
    end

end
