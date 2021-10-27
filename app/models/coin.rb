class Coin < ApplicationRecord
    #No meu model coin ele irar conversar com mining_type
    #Belongs_to = pertence a...
    belongs_to :mining_type, optional: true
end