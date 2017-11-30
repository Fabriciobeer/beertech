class Receitum < ActiveRecord::Base
    belongs_to :cliente
    
    validates :cliente_id, presence: true
    validates :nome_receita, presence: true, :uniqueness => {:scope => [:itens_receita], :case_sensitive => false }
    validates :itens_receita, presence: true, :uniqueness => {:scope => [:nome_receita], :case_sensitive => false }
    validates :quantidade_usada, presence: true
    validates :unidade_receita, presence: true
end
