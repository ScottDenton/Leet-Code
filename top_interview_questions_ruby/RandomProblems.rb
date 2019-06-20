def subdomain_visits(cpdomains)
  hash =Hash.new(0)
  cpdomains.each do |domain|
    arr = domain.split(' ')
    hash[arr[1]] += arr[0].to_i

    split = arr[1].split('.')
    i = 1
    while i < split.length
        hash[split[i..-1].join('.')] += arr[0].to_i
        i +=1
    end
  end
  hash.map{|key, value| [value.to_s, key].join(' ')}
end

# pp subdomain_visits(["900 google.mail.com", "50 yahoo.com", "1 intel.mail.com", "5 wiki.org"])


def roman_to_int(s)
  numerals = {1000 => "M", 900 => "CM", 500 => "D", 400 => "CD", 100 => "C", 90 => "XC", 50 => "L", 40 => "XL", 10 => "X", 9 => "IX", 5 => "V", 4 => "IV", 1 => "I"}

  answer = []
  arr = s.split("")
  i = 0
  while i < arr.length
    double = numerals.find{|k,v| arr[i..i+1].join("") == v}
    single = numerals.find{|k,v| arr[i] == v}
    if double
      answer.push(double[0])
      i+=2
    else
      answer.push(single[0])
      i+=1
    end
  end
  answer.reduce(:+)
end

# pp roman_to_int("MCMXCIV")
