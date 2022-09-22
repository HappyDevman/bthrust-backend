# frozen_string_literal: true

module Tasks
  class FillInTable::SolutionEvaluator < SolutionEvaluatorBase
    def correct?(item_session)
      corrects = item_session.task_item.options.map(&:split_answers)
      clean_answers = clean(item_session.answers)

      clean_answers.zip(corrects).all? do |answer, correct|
        clean(correct).include?(answer)
      end
    end

    private

    def clean(answers)
      answers.map { |a| a.gsub(/[^\s[:alnum:]-]/, '')&.downcase }
    end
  end
end
