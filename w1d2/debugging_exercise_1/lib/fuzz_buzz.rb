# Debug this code to pass rspec! There is 1 mistake to fix.

# Write a method, fuzz_buzz, that accepts a number as an arg. 
# The method should return an array of numbers from one to the given number that are not divisible by 3 or 5.

require "byebug"

def fuzz_buzz(num)
    numbers = []

    (1..num).each do |i|
        if i % 3 != 0 && i % 5 != 0
            numbers << i
        end
    end

    numbers
end


def caesar_cipher(str, num)
    cipher = ""
    alphabet = "abcdefghijklmnopqrstuvwxyz"
  
    str.each_char do |char|
      old_idx = alphabet.index(char)
      new_idx = old_idx + num
      cipher += alphabet[new_idx % 26]
    end
  
    return cipher
  end
  
  puts caesar_cipher("apple", 1)    #=> "bqqmf"
  puts caesar_cipher("bootcamp", 2) #=> "dqqvecor"
  puts caesar_cipher("zebra", 4)    #=> "difve"