class Item < ActiveRecord::Base
    belongs_to :cliente
    has_many :estoquefinals
    has_many :ciclovidas
    
    validates :cliente_id, presence: true
    validates :item_name, presence: true, uniqueness: { case_sensitive: false }
    validates :barcode, presence: true, uniqueness: { case_sensitive: false }
end
