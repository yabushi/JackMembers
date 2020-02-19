class Band < ApplicationRecord
    has_many :coma

    validates :bandname,:members,:teien,:gakunai, presence:true
    validates :teien,:gakunai, numericality:{only_integer:true}
end
