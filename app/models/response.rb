# == Schema Information
#
# Table name: responses
#
#  id               :bigint(8)        not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  validate :respondent_already_answered?

  belongs_to :answer_choice,
    class_name: :AnswerChoice,
    foreign_key: :answer_choice_id,
    primary_key: :id

  belongs_to :respondent,
    class_name: :User,
    foreign_key: :user_id,
    primary_key: :id

  has_one :question,
    through: :answer_choice,
    source: :question

  def sibling_responses
    self.question.responses
  end

  def respondent_already_answered?
    respondent_id = self.user_id
    answer_id = self.answer_choice_id
    if Response.where(user_id: respondent_id, answer_choice_id: answer_id).exists?
      errors[:duplicate] << "you cannot respond more than once"
    end
  end
end
