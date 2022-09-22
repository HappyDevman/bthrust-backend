# frozen_string_literal: true

module Students
  module DeviseHelpers
    extend ActiveSupport::Concern

    included do
      before_action :set_sentry_context, :find_current_student
    end

    private

    def find_current_student
      Student.current = current_student
    end

    def set_sentry_context
      Sentry.configure_scope do |scope|
        scope.set_user(id: current_student.id, type: 'Student') if current_student
      end
    end
  end
end
