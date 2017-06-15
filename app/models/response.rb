class Response < ActiveRecord::Base
  belongs_to :user
  belongs_to :quiz

  def initialize
    @left = 0
    @right = 0
    @political_stance = 0
  end

  def stance_determinator(answer_1, answer_2, answer_3, answer_4, answer_5)

    # although it may appear easy, this cannot be simply dried up because the questions and answers intentionally do not have a pattern granting points to the left or right based on degree of agreement... rather the answers giving points to left or right are mixed up so that users do not consciously(or subconsiously) abuse a pattern they might have noticed.

    if answer_1 == "Strongly Agree"
      @left += 3
    elsif answer_1 == "Strongly Disagree"
      @right += 3
    elsif answer_1 == "Agree"
      @left += 2
    elsif answer_1 == "Disagree"
      @right += 2
    end

    if answer_2 == "Strongly Agree"
      @left += 3
    elsif answer_2 == "Strongly Disagree"
      @right += 3
    elsif answer_2 == "Agree"
      @left += 2
    elsif answer_2 == "Disagree"
      @right += 2
    end

    if answer_3 == "Strongly Agree"
      @right += 3
    elsif answer_3 == "Strongly Disagree"
      @left += 3
    elsif answer_3 == "Agree"
      @right += 2
    elsif answer_3 == "Disagree"
      @left += 2
    end

    if answer_4 == "Strongly Agree"
      @right += 3
    elsif answer_4 == "Strongly Disagree"
      @left += 3
    elsif answer_4 == "Agree"
      @right += 2
    elsif answer_4 == "Disagree"
      @left += 2
    end

    if answer_5 == "Strongly Agree"
      @left += 3
    elsif answer_5 == "Strongly Disagree"
      @right += 3
    elsif answer_5 == "Agree"
      @left += 2
    elsif answer_5 == "Disagree"
      @right += 2
    end

    if @left <= 1
      @political_stance = 7
    elsif @left >= 2 && @left <= 4
      @political_stance = 6
    elsif @left >= 5 && @left <= 6
      @political_stance = 5
    elsif @left >= 7 && @left <= 8
      @political_stance = 4
    elsif @left >= 9 && @left <= 10
      @political_stance = 3
    elsif @left >= 11 && @left <= 13
      @political_stance = 2
    elsif @left >= 14 && @left <= 15
      @political_stance = 1
    end
  end

end
