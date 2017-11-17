class Item < ActiveRecord::Base
    belongs_to :cliente
    has_many :estoquefinals
    has_many :ciclovidas
    
    validates :cliente_id, presence: true
    validates :item, presence: true
    validates :barcode, presence: true
end
