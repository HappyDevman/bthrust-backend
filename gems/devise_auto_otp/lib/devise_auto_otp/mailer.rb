# frozen_string_literal: true

require 'devise/mailer'

module DeviseAutoOtp
  module Mailer
    def self.initialize!
      Devise::Mailer.include(self)
    end

    def otp_instructions(record, otp, opts = {})
      @otp = otp
      data = {
        template_id: 'd-f8773a7dbdcd469085d6e58f98fce6d9',
        dynamic_template_data: {
          unique_code: @otp
        }
      }
      I18n.with_locale(locale_for_resource(record)) do
        devise_mail(record, :otp_instructions, opts.merge(data))
      end
    end

    private

    def locale_for_resource(record)
      record.respond_to?(:locale) &&
        record.locale.presence ||
        'en'
    end
  end
end
