# frozen_string_literal: true

module AdaNumbers
  class Settings
    class Parameters
      LANGUAGES = {
        en: :english,
        pt: :portuguese
      }

      SCALES = {
        short: :short,
        long:  :long
      }

      @hello = "hi"
      class << self
        attr_accessor :hello
      end
    end

    @language = Parameters::LANGUAGES[:en]
    @scale    = Parameters::SCALES[:long]

    class << self
      attr_accessor :language, :scale

      def reset
        @language = Parameters::LANGUAGES[:en]
        @scale    = Parameters::SCALES[:short]
      end
    end
  end
end
