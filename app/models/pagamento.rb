class Pagamento < ActiveRecord::Base
    belongs_to :cliente
    
    validates :cliente_id, presence: true
    validates :total_pagar, presence: true
    
end
