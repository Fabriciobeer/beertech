class Cliente < ActiveRecord::Base
    has_many :users
    has_many :pagamentos
    has_many :estoquefinals
    has_many :estoquemps
    has_many :ciclovidas
    has_many :items
end
