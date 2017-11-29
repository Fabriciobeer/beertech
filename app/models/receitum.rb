class Receitum < ActiveRecord::Base
    belongs_to :cliente
    
    validates :cliente_id, presence: true
    validates :nome_receita, presence: true
    validates :itens_receita, presence: true
    validates :quantidade_usada, presence: true
    validates :unidade_receita, presence: true
end
