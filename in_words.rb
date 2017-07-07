
class Integer

  def in_words(recursive=false)
    case self.to_s
    when /\b0\b/          then "zero" unless recursive
    when /\b\d\b/         then UNIT[self]
    when /\b1\d\b/        then TEENS[self]
    when /\b\d{2}\b/
      tens = self.floor(-1)
      "#{TENS[tens]} #{(self-tens).in_words(true)}".rstrip
    when /\b\d{3}\b/
      hundreds = self.floor(-2)
      "#{UNIT[hundreds/100]} hundred #{(self-hundreds).in_words(true)}".rstrip
    when /\b\d{4,15}\b/
      blocks = (self.to_s.length-1)/3
      grand = self.floor(-blocks*3)
      "#{(grand/1_000**blocks).in_words(true)} #{MAGNITUDES[1_000**blocks]} #{(self-grand).in_words(true)}".rstrip
    else "Nooo"
    end
  end

  UNIT ||= {
    0 => "zero",
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine"
  }
  TEENS ||= {
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen"
  }
  TENS ||= {
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety"
  }

  MAGNITUDES ||= {
    100 => "hundred",
    1000 => "thousand",
    1_000_000 => "million",
    1_000_000_000 => "billion",
    1_000_000_000_000 => "trillion"
  }

end
