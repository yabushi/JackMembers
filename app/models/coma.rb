class Coma < ApplicationRecord
    belongs_to :band, optional: true

    validates :date, :term, :canmod, presence:true
    validates :band_id, numericality:{onry_integer:true}
end
