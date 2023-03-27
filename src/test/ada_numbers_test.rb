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
        #actual = AdaNumbers::NumberToWordsConverter::Pt.convert to_convert
        assert_equal expected, actual
      end
    end
  end

end
