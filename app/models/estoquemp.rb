class Estoquemp < ActiveRecord::Base
    belongs_to :cliente
    
    validates :cliente_id, presence: true
    validates :item, presence: true
    validates :quantidade_atual, presence: true
    validates :fornecedor, presence: true
    validates :atualizar, presence:true
end
