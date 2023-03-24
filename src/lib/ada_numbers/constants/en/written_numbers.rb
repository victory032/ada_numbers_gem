module AdaNumbers
  module WrittenNumber
    class En
      ZERO               = "Zero"
      ONE                = "One"
      TWO                = "Two"
      THREE              = "Three"
      FOUR               = "Four"
      FIVE               = "Five"
      SIX                = "Six"
      SEVEN              = "Seven"
      EIGHT              = "Eight"
      NINE               = "Nine"
      TEN                = "Ten"
      ELEVEN             = "Eleven"
      TWELVE             = "Twelve"
      THIRTEEN           = "Thirteen"
      FOURTEEN           = "Fourteen"
      FIFTEEN            = "Fifteen"
      SIXTEEN            = "Sixteen"
      SEVENTEEN          = "Seventeen"
      EIGHTEEN           = "Eighteen"
      NINETEEN           = "Nineteen"
      TWENTY             = "Twenty"
      THIRTY             = "Thirty"
      FORTY              = "Forty"
      FIFTY              = "Fifty"
      SIXTY              = "Sixty"
      SEVENTY            = "Seventy"
      EIGHTY             = "Eighty"
      NINETY             = "Ninety"
      HUNDRED            = "Hundred"
      THOUSAND           = "Thousand"
      MILLION            = "Million"
      THOUSAND_MILLION   = "Thousand Million"
      BILLION            = "Billion"
      TRILLION           = "Trillion"

      @@numbers_that_ignore_separator = [
        HUNDRED, THOUSAND, MILLION,
        THOUSAND_MILLION, BILLION, TRILLION
      ]

      @@unities_that_combine_with_separator = [
        TWENTY, THIRTY, FORTY, FIFTY,
        SIXTY, SEVENTY, EIGHTY, NINETY
      ]

      @@words_to_number_map = {
        ZERO     => 0,  ONE     => 1,  TWO       => 2,  THREE    => 3,   FOUR     => 4,
        FIVE     => 5,  SIX     => 6,  SEVEN     => 7,  EIGHT    => 8,   NINE     => 9,
        TEN      => 10, ELEVEN  => 11, TWELVE    => 12, THIRTEEN => 13,  FOURTEEN => 14,
        FIFTEEN  => 15, SIXTEEN => 16, SEVENTEEN => 17, EIGHTEEN => 18,  NINETEEN => 19,
        TWENTY   => 20, THIRTY  => 30, FORTY     => 40, FIFTY    => 50,  SIXTY    => 60,
        SEVENTY  => 70, EIGHTY  => 80, NINETY    => 90, HUNDRED  => 100, THOUSAND => 1e3.to_i,
        MILLION  => 1e6.to_i
      }

      @@words_to_number_unities_and_tens_map = {
        ZERO     => 0,  ONE     => 1,  TWO       => 2,  THREE    => 3,   FOUR     => 4,
        FIVE     => 5,  SIX     => 6,  SEVEN     => 7,  EIGHT    => 8,   NINE     => 9,
        TEN      => 10, ELEVEN  => 11, TWELVE    => 12, THIRTEEN => 13,  FOURTEEN => 14,
        FIFTEEN  => 15, SIXTEEN => 16, SEVENTEEN => 17, EIGHTEEN => 18,  NINETEEN => 19,
        TWENTY   => 20, THIRTY  => 30, FORTY     => 40, FIFTY    => 50,  SIXTY    => 60,
        SEVENTY  => 70, EIGHTY  => 80, NINETY    => 90
      }

      @@words_to_number_map_long_scale = {
        THOUSAND_MILLION => 1e9.to_i,
        BILLION          => 1e12.to_i
      }

      @@words_to_number_map_shor_scale = {
        BILLION  => 1e9.to_i,
        TRILLION => 1e12.to_i
      }

      @@not_to_combine_with_thousand = [
        MILLION, BILLION, TRILLION
      ]

      @@numbers_to_words_map_unities = {
        0 => ZERO, 1 => ONE, 2 => TWO  , 3 => THREE, 4 => FOUR,
        5 => FIVE, 6 => SIX, 7 => SEVEN, 8 => EIGHT, 9 => NINE
      }

      @@numbers_to_words_map_tens = {
        10 => TEN    , 11 => ELEVEN , 12 => TWELVE   , 13 => THIRTEEN, 14 => FOURTEEN,
        15 => FIFTEEN, 16 => SIXTEEN, 17 => SEVENTEEN, 18 => EIGHTEEN, 19 => NINETEEN,
        20 => TWENTY , 30 => THIRTY , 40 => FORTY    , 50 => FIFTY   , 60 => SIXTY   ,
        70 => SEVENTY, 80 => EIGHTY , 90 => NINETY
      }
    end
  end
end
