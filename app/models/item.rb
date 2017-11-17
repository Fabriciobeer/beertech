class Item < ActiveRecord::Base
    belongs_to :cliente
    has_many :estoquefinals
    has_many :ciclovidas
end
