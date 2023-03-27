require "test_helper"

class AdaNumbersTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::AdaNumbers::VERSION
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
      to_convert = test_set.first
      expected = test_set.last

      it "#{to_convert} should be '#{expected}'" do
        actual = to_convert.to_w
        assert_equal expected, actual
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
        to_convert = test_set.first
        expected = test_set.last

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
        [999, "Novecentos e Noventa e Nove" ],
      ].each do |test_set|
        to_convert = test_set.first
        expected = test_set.last

        it "#{to_convert} should be '#{expected}'" do
          actual = to_convert.to_w
          assert_equal expected, actual
        end
      end
    end
  end

end
