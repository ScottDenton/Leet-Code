def num_jewels_in_stones(j, s)
  j.split('').map{|i| s.scan(/#{i}/)}.flatten.count
end

# p num_jewels_in_stones('aA', 'aAAbbb')
# p "aAAAbbb".split('')


def unique_morse_representations(words)
code = [".-","-...","-.-.","-..",".","..-.","--.","....","..",".---","-.-",".-..","--","-.","---",".--.","--.-",".-.","...","-","..-","...-",".--","-..-","-.--","--.."]

    words.map do |word|
        word.split("").map do |w|
            code[(w[0].ord)-97]
        end.join('')
    end.uniq.count
end
p unique_morse_representations(["gin", "zen", "gig", "msg"])
