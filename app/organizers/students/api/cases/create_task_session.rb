# frozen_string_literal: true

module Students
  module API
    module Cases
      class CreateTaskSession < Micro::Case::Strict
        attributes :lesson_session, :task
        attr_accessor :task_session

        def call!
          TaskSession.transaction do
            create_task_session!
            lesson_session.update!(current_task_session: task_session)
          end

          Success(task_session: task_session)
        end

        private

        def create_task_session!
          @task_session = task.task_sessions.create!(
            lesson_session: lesson_session,
            status: :active
          )

          precreate_task_item_sessions
        end

        def precreate_task_item_sessions
          task_session.task.items.each do |item|
            task_session.task_item_sessions.precreate_from_item!(item)
          end
        end

        def empty_task_session?
          lesson_session.current_task_session_id.blank?
        end
      end
    end
  end
end
