module AdaNumbers
  module WrittenNumber
    class Pt
      ZERO                = "Zero"
      ONE                 = "Um"
      TWO                 = "Dois"
      THREE               = "Três"
      FOUR                = "Quatro"
      FIVE                = "Cinco"
      SIX                 = "Seis"
      SEVEN               = "Sete"
      EIGHT               = "Oito"
      NINE                = "Nove"
      TEN                 = "Dez"
      ELEVEN              = "Onze"
      TWELVE              = "Doze"
      THIRTEEN            = "Treze"
      FOURTEEN            = "Catorze"
      FIFTEEN             = "Quinze"
      SIXTEEN             = "Dezasseis"
      SEVENTEEN           = "Dezassete"
      EIGHTEEN            = "Dezoito"
      NINETEEN            = "Dezanove"
      TWENTY              = "Vinte"
      THIRTY              = "Trinta"
      FORTY               = "Quarenta"
      FIFTY               = "Cinquenta"
      SIXTY               = "Sessenta"
      SEVENTY             = "Setenta"
      EIGHTY              = "Oitenta"
      NINETY              = "Noventa"
      ONE_HUNDRED_SINGLE  = "Cem"
      ONE_HUNDRED         = "Cento"
      TWO_HUNDRED         = "Duzentos"
      THREE_HUNDRED       = "Trezentos"
      FOUR_HUNDRED        = "Quatrocentos"
      FIVE_HUNDRED        = "Quinhentos"
      SIX_HUNDRED         = "Seiscentos"
      SEVEN_HUNDRED       = "Setecentos"
      EIGHT_HUNDRED       = "Oitocentos"
      NINE_HUNDRED        = "Novecentos"
      THOUSAND            = "Mil"
      MILLION_SINGULAR    = "Um Milhão"
      MILLION_PLURAL      = "Milhões"
      THOUSAND_MILLION    = "Mil Milhões"
      BILLION_SINGULAR    = "Um Bilião"
      BILLION_PLURAL      = "Biliões"
      TRILLION_SINGULAR   = "Um Trilião"
      TRILLION_PLURAL     = "Triliões"

      @@numbers_that_ignore_separator = [
        ONE_HUNDRED, TWO_HUNDRED, THREE_HUNDRED, FOUR_HUNDRED, FIVE_HUNDRED,
        SIX_HUNDRED, SEVEN_HUNDRED, EIGHT_HUNDRED, NINE_HUNDRED, THOUSAND,
        MILLION_SINGULAR, MILLION_PLURAL, THOUSAND_MILLION, BILLION_SINGULAR,
        BILLION_PLURAL, TRILLION_SINGULAR, TRILLION_PLURAL
      ]

      def self.numbers_that_ignore_separator; @@numbers_that_ignore_separator; end

      @@words_to_number_map = {
        ZERO           => 0,   ONE                => 1,   TWO          => 2,        THREE             => 3,
        FOUR           => 4,   FIVE               => 5,   SIX          => 6,        SEVEN             => 7,
        EIGHT          => 8,   NINE               => 9,   TEN          => 10,       ELEVEN            => 11,
        TWELVE         => 12,  THIRTEEN           => 13,  FOURTEEN     => 14,       FIFTEEN           => 15,
        SIXTEEN        => 16,  SEVENTEEN          => 17,  EIGHTEEN     => 18,       NINETEEN          => 19,
        TWENTY         => 20,  THIRTY             => 30,  FORTY        => 40,       FIFTY             => 50,
        SIXTY          => 60,  SEVENTY            => 70,  EIGHTY       => 80,       NINETY            => 90,
        ONE_HUNDRED    => 100, ONE_HUNDRED_SINGLE => 100, TWO_HUNDRED  => 200,      THREE_HUNDRED     => 300,
        FOUR_HUNDRED   => 400, FIVE_HUNDRED       => 500, SIX_HUNDRED  => 600,      SEVEN_HUNDRED     => 700,
        EIGHT_HUNDRED  => 800, NINE_HUNDRED       => 900, THOUSAND     => 1e3.to_i, MILLION_SINGULAR  => 1e6.to_i,
        MILLION_PLURAL => 1e6.to_i
      }

      def self.words_to_number_map; @@words_to_number_map; end

      @@words_to_number_map_long_scale = {
        THOUSAND_MILLION => 1e9.to_i,
        BILLION_SINGULAR => 1e12.to_i,
        BILLION_PLURAL   => 1e12.to_i
      }

      def self.words_to_number_map_long_scale; @@words_to_number_map_long_scale; end

      @@words_to_number_map_short_scale = {
        BILLION_SINGULAR  => 1e9.to_i,
        BILLION_PLURAL    => 1e9.to_i,
        TRILLION_SINGULAR => 1e12.to_i,
        TRILLION_PLURAL   => 1e12.to_i
      }

      def self.words_to_number_map_short_scale; @@words_to_number_map_short_scale; end

      @@not_to_combine_with_thousand = [
        MILLION_SINGULAR, BILLION_PLURAL, TRILLION_PLURAL
      ]

      def self.not_to_combine_with_thousand; @@not_to_combine_with_thousand; end

      @@numbers_to_words_map_unities = {
        0 => ZERO, 1 => ONE, 2 => TWO  , 3 => THREE, 4 => FOUR,
        5 => FIVE, 6 => SIX, 7 => SEVEN, 8 => EIGHT, 9 => NINE
      }

      def self.numbers_to_words_map_unities; @@numbers_to_words_map_unities; end

      @@numbers_to_words_map_tens = {
        10 => TEN    , 11 => ELEVEN , 12 => TWELVE   , 13 => THIRTEEN, 14 => FOURTEEN,
        15 => FIFTEEN, 16 => SIXTEEN, 17 => SEVENTEEN, 18 => EIGHTEEN, 19 => NINETEEN,
        20 => TWENTY , 30 => THIRTY , 40 => FORTY    , 50 => FIFTY   , 60 => SIXTY   ,
        70 => SEVENTY, 80 => EIGHTY , 90 => NINETY
      }

      def self.numbers_to_words_map_tens; @@numbers_to_words_map_tens; end
    end
  end
end
