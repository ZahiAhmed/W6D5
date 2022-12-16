# == Schema Information
#
# Table name: cats
#
#  id          :bigint           not null, primary key
#  birthdate   :date             not null
#  color       :string           not null
#  name        :string           not null
#  sex         :string(1)        not null
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Cat < ApplicationRecord
    CAT_COLORS = ["white", "black", "orange", "grey", "brown"]
    validates :color, presence: true, inclusion: { in: CAT_COLORS}
    validates :sex, presence: true, inclusion: { in: %w(M F) }
    validate :birth_date_cannot_be_future 

    def birth_date_cannot_be_future
        if birthdate.present? && birthdate > Date.today
            errors.add(:birthdate, "Invalid Cat Birthdate")
        end
    end
end
