require "test_helper"

class AdaNumbersTest < Minitest::Test
  def self.select_scale(scale)
    AdaNumbers::Settings.scale = AdaNumbers::Settings::Parameters::SCALES[scale]
  end

  def self.explode(set)
    return set.first, set.last
  end

  def test_that_it_has_a_version_number
    refute_nil ::AdaNumbers::VERSION
  end

  describe "Sample" do
    [

    ].each do |test_set|
      to_convert, expected = AdaNumbersTest.explode test_set

      it "#{to_convert} should be '#{expected}'" do
        actual = to_convert.to_w
        assert_equal expected, actual
      end
    end
  end

  describe "Unities are valid" do
    [
      [0, "Zero"],
      [1, "Um"],
      [2, "Dois"],
      [3, "Três"],
      [4, "Quatro"],
      [5, "Cinco"],
      [6, "Seis"],
      [7, "Sete"],
      [8, "Oito"],
      [9, "Nove"]
    ].each do |test_set|
      to_convert, expected = AdaNumbersTest.explode test_set

      it "#{to_convert} should be '#{expected}'" do
        actual = to_convert.to_w
        assert_equal expected, actual
      end
    end
  end

  describe "Tens are valid" do
      [
        [10, "Dez"],
        [11, "Onze"],
        [12, "Doze"],
        [13, "Treze"],
        [14, "Catorze"],
        [15, "Quinze"],
        [16, "Dezasseis"],
        [17, "Dezassete"],
        [18, "Dezoito"],
        [19, "Dezanove"],
        [20, "Vinte"],
        [21, "Vinte e Um"],
        [30, "Trinta"],
        [32, "Trinta e Dois"],
        [40, "Quarenta"],
        [43, "Quarenta e Três"],
        [50, "Cinquenta"],
        [54, "Cinquenta e Quatro"],
        [60, "Sessenta"],
        [65, "Sessenta e Cinco"],
        [70, "Setenta"],
        [76, "Setenta e Seis"],
        [80, "Oitenta"],
        [87, "Oitenta e Sete"],
        [90, "Noventa"],
        [98, "Noventa e Oito"]
      ].each do |test_set|
        to_convert, expected = AdaNumbersTest.explode test_set

        it "#{to_convert} should be '#{expected}'" do
          actual = to_convert.to_w
          assert_equal expected, actual
        end
      end
    end

  describe "Hundred are valid" do
      [
        [100, "Cem" ],
        [101, "Cento e Um" ],
        [111, "Cento e Onze" ],
        [121, "Cento e Vinte e Um" ],
        [200, "Duzentos" ],
        [202, "Duzentos e Dois" ],
        [212, "Duzentos e Doze" ],
        [222, "Duzentos e Vinte e Dois" ],
        [300, "Trezentos" ],
        [303, "Trezentos e Três" ],
        [313, "Trezentos e Treze" ],
        [333, "Trezentos e Trinta e Três" ],
        [400, "Quatrocentos" ],
        [404, "Quatrocentos e Quatro" ],
        [414, "Quatrocentos e Catorze" ],
        [444, "Quatrocentos e Quarenta e Quatro" ],
        [500, "Quinhentos" ],
        [505, "Quinhentos e Cinco" ],
        [515, "Quinhentos e Quinze" ],
        [555, "Quinhentos e Cinquenta e Cinco" ],
        [600, "Seiscentos" ],
        [606, "Seiscentos e Seis" ],
        [616, "Seiscentos e Dezasseis" ],
        [666, "Seiscentos e Sessenta e Seis" ],
        [700, "Setecentos" ],
        [707, "Setecentos e Sete" ],
        [717, "Setecentos e Dezassete" ],
        [777, "Setecentos e Setenta e Sete" ],
        [800, "Oitocentos" ],
        [808, "Oitocentos e Oito" ],
        [818, "Oitocentos e Dezoito" ],
        [888, "Oitocentos e Oitenta e Oito" ],
        [900, "Novecentos" ],
        [909, "Novecentos e Nove" ],
        [919, "Novecentos e Dezanove" ],
        [999, "Novecentos e Noventa e Nove" ]
      ].each do |test_set|
        to_convert, expected = AdaNumbersTest.explode test_set

        it "#{to_convert} should be '#{expected}'" do
          actual = to_convert.to_w
          assert_equal expected, actual
        end
      end
  end

  describe "Thousands are valid" do
    [
      [1000, "Mil"],
      [1001, "Mil e Um"],
      [1011, "Mil e Onze"],
      [1111, "Mil Cento e Onze"],
      [10000, "Dez Mil"],
      [10001, "Dez Mil e Um"],
      [34001, "Trinta e Quatro Mil e Um"],
      [140000, "Cento e Quarenta Mil"],
      [140001, "Cento e Quarenta Mil e Um"]
    ].each do |test_set|
      to_convert, expected = AdaNumbersTest.explode test_set

      it "#{to_convert} should be '#{expected}'" do
        actual = to_convert.to_w
        assert_equal expected, actual
      end
    end
  end

  describe "Millions are valid" do
    [
      [1000000, "Um Milhão"],
      [1000001, "Um Milhão e Um"],
      [1000011, "Um Milhão e Onze"],
      [1000022, "Um Milhão e Vinte e Dois"],
      [1000122, "Um Milhão Cento e Vinte e Dois"],
      [2000122, "Dois Milhões Cento e Vinte e Dois"],
      [20000122, "Vinte Milhões Cento e Vinte e Dois"],
      [22000122, "Vinte e Dois Milhões Cento e Vinte e Dois"]
    ].each do |test_set|
      to_convert, expected = AdaNumbersTest.explode test_set
      AdaNumbersTest.select_scale :long

      it "#{to_convert} should be '#{expected}'" do
        actual = to_convert.to_w
        assert_equal expected, actual
      end
    end
  end

  describe "Thousand Millions are valid" do
    [
      [1000000000, "Mil Milhões"],
      [1000000001, "Mil Milhões e Um"],
      [1000000011, "Mil Milhões e Onze"],
      [1000000022, "Mil Milhões e Vinte e Dois"],
      [1000000122, "Mil Milhões Cento e Vinte e Dois"],
      [2000000122, "Dois Mil Milhões Cento e Vinte e Dois"],
      [20000000122, "Vinte Mil Milhões Cento e Vinte e Dois"],
      [22000000122, "Vinte e Dois Mil Milhões Cento e Vinte e Dois"]
    ].each do |test_set|
      to_convert, expected = AdaNumbersTest.explode test_set

      it "#{to_convert} should be '#{expected}'" do
        AdaNumbersTest.select_scale :long
        actual = to_convert.to_w
        assert_equal expected, actual
      end
    end
  end

  describe "Thousand Millions in short scale (billions) are valid" do
    [
      [1000000000, "Um Bilião"],
      [1000000001, "Um Bilião e Um"],
      [1000000011, "Um Bilião e Onze"],
      [1000000022, "Um Bilião e Vinte e Dois"],
      [1000000122, "Um Bilião Cento e Vinte e Dois"],
      [2000000122, "Dois Biliões Cento e Vinte e Dois"],
      [20000000122, "Vinte Biliões Cento e Vinte e Dois"],
      [22000000122, "Vinte e Dois Biliões Cento e Vinte e Dois"]
    ].each do |test_set|
      to_convert, expected = AdaNumbersTest.explode test_set

      it "#{to_convert} should be '#{expected}'" do
        AdaNumbersTest.select_scale :short
        actual = to_convert.to_w
        assert_equal expected, actual
      end
    end
  end

  describe "Billions are valid" do
    [
      [1000000000000, "Um Bilião"],
      [1000000000001, "Um Bilião e Um"],
      [1000000000011, "Um Bilião e Onze"],
      [1000000000022, "Um Bilião e Vinte e Dois"],
      [1000000000122, "Um Bilião Cento e Vinte e Dois"],
      [2000000000122, "Dois Biliões Cento e Vinte e Dois"],
      [20000000000122, "Vinte Biliões Cento e Vinte e Dois"],
      [22000000000122, "Vinte e Dois Biliões Cento e Vinte e Dois"]
    ].each do |test_set|
      to_convert, expected = AdaNumbersTest.explode test_set

      it "#{to_convert} should be '#{expected}'" do
        AdaNumbersTest.select_scale :long
        actual = to_convert.to_w
        assert_equal expected, actual
      end
    end
  end

  describe "Billions in short scale (trillions) are valid" do
    [
      [1000000000000, "Um Trilião"],
      [1000000000001, "Um Trilião e Um"],
      [1000000000011, "Um Trilião e Onze"],
      [1000000000022, "Um Trilião e Vinte e Dois"],
      [1000000000122, "Um Trilião Cento e Vinte e Dois"],
      [2000000000122, "Dois Triliões Cento e Vinte e Dois"],
      [20000000000122, "Vinte Triliões Cento e Vinte e Dois"],
      [22000000000122, "Vinte e Dois Triliões Cento e Vinte e Dois"],
    ].each do |test_set|
      to_convert, expected = AdaNumbersTest.explode test_set

      it "#{to_convert} should be '#{expected}'" do
        AdaNumbersTest.select_scale :short
        actual = to_convert.to_w
        assert_equal expected, actual
      end
    end
  end

  describe "Random integers are valid" do
    [
      [42, "Quarenta e Dois" ],
      [102, "Cento e Dois" ],
      [113, "Cento e Treze" ],
      [123, "Cento e Vinte e Três" ],
      [902, "Novecentos e Dois" ],
      [99, "Noventa e Nove" ],
      [999, "Novecentos e Noventa e Nove" ],
      [1000, "Mil" ],
      [1123, "Mil Cento e Vinte e Três" ],
      [30000, "Trinta Mil" ],
      [10123, "Dez Mil Cento e Vinte e Três" ],
      [21123, "Vinte e Um Mil Cento e Vinte e Três" ],
      [100000, "Cem Mil" ],
      [100123, "Cem Mil Cento e Vinte e Três" ],
      [112123, "Cento e Doze Mil Cento e Vinte e Três" ],
      [134123, "Cento e Trinta e Quatro Mil Cento e Vinte e Três" ]
    ].each do |test_set|
      to_convert, expected = AdaNumbersTest.explode test_set

      it "#{to_convert} should be '#{expected}'" do
        actual = to_convert.to_w
        assert_equal expected, actual
      end
    end
  end

  describe "Random decimals are valid" do
    [
      [42.2, "Quarenta e Dois vírgula Dois" ],
      [102.0, "Cento e Dois" ],
      [103.000, "Cento e Três" ],
      [113.02, "Cento e Treze vírgula Zero Dois" ],
      [123.0045, "Cento e Vinte e Três vírgula Zero Zero Quarenta e Cinco" ],
      [902.982, "Novecentos e Dois vírgula Novecentos e Oitenta e Dois" ],
      [100000.001, "Cem Mil vírgula Zero Zero Um" ],
      [100123.100123, "Cem Mil Cento e Vinte e Três vírgula Cem Mil Cento e Vinte e Três" ]
    ].each do |test_set|
      to_convert, expected = AdaNumbersTest.explode test_set

      it "#{to_convert} should be '#{expected}'" do
        actual = to_convert.to_w
        assert_equal expected, actual
      end
    end
  end

end
