# == Schema Information
#
# Table name: questions
#
#  id         :bigint(8)        not null, primary key
#  text       :string           not null
#  poll_id    :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Question < ApplicationRecord

  belongs_to :poll,
    class_name: :Poll,
    foreign_key: :poll_id,
    primary_key: :id

  has_many :answer_choices,
    class_name: :AnswerChoice,
    foreign_key: :question_id,
    primary_key: :id

end
