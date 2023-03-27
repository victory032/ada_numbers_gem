require_relative './pt/number_to_words_converter'

class Float
  def to_words
    AdaNumbers::NumberToWordsConverter::Pt.convert self
  end

  def to_w
    to_words
  end
end

class Integer
  def to_words
    AdaNumbers::NumberToWordsConverter::Pt.convert self
  end

  def to_w
    to_words
  end
end
