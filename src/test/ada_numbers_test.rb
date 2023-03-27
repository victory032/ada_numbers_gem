require "test_helper"

class AdaNumbersTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::AdaNumbers::VERSION
  end

  describe "Unities are valid" do
    [
      #[0, "Zero"],
      #[1, "Um"],
      #[2, "Dois"],
      #[3, "Três"],
      #[4, "Quatro"],
      #[5, "Cinco"],
      #[6, "Seis"],
      #[7, "Sete"],
      #[8, "Oito"],
      #[9, "Nove"]
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
  end

end
