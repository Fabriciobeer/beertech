class Materiaprima < ActiveRecord::Base
    belongs_to :cliente
    
    validates :cliente_id, presence: true
    validates :item, presence: true, :uniqueness => {:scope => [:tamanho_pacote, :unidades]}
    validates :unidades, presence: true
    validates :tamanho_pacote, presence: true
end
