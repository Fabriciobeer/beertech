class Ciclovida < ActiveRecord::Base
    belongs_to :cliente
    belongs_to :item
    
    validates :cliente_id, presence: true
    validates :item_id, presence: true
    validates :localizacao, presence:true
end
