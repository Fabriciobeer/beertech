class Ciclovida < ActiveRecord::Base
    belongs_to :cliente
    belongs_to :item
end
