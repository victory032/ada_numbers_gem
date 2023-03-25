# frozen_string_literal: true

module AdaNumbers
  class Settings
    class Parameters
      LANGUAGES = {
        en: "English",
        pt: "Portuguese"
      }

      SCALES = {
        short: "Short",
        long:   "Long"
      }

      @hello = "hi"
      class << self
        attr_accessor :hello
      end
    end

    Parameters.hello = 2
  end
end
