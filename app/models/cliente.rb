class Cliente < ActiveRecord::Base
    has_many :users
    has_many :pagamentos
    has_many :estoquefinals
    has_many :estoquemps
    has_many :ciclovidas
    has_many :items
    
    VALID_CNPJ_REGEX = /\A(\d{2}\.?\d{3}\.?\d{3}\/?\d{4}-?\d{2})\z/i
    validates :nome_cervejaria, presence: true, uniqueness: { case_sensitive: false }, length: {minimum:3, maximum:25}
    validates :CNPJ, presence: true, uniqueness: {case_sensitive: false}, format: { with: VALID_CNPJ_REGEX }
end
