# == Schema Information
#
# Table name: subs
#
#  id           :bigint           not null, primary key
#  description  :text
#  title        :string           not null
#  moderator_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Sub < ApplicationRecord
    validates :title, uniqueness: true
    validates :moderator_id, :title, presence:true 

    belongs_to :moderator,
        foreign_key: :moderator_id,
        class_name: :User 

end
