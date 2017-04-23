# Given a nonnegative integer, return a hash whose keys are all the odd nonnegative integers up to it
# and each key's value is an array containing all the even non negative integers up to it.
#
# Examples:
# staircase 1  # => {1 => []}
# staircase 2  # => {1 => []}
# staircase 3  # => {1 => [], 3 => [2]}
# staircase 4  # => {1 => [], 3 => [2]}
# staircase 5  # => {1 => [], 3 => [2], 5 =>[2, 4]}

def staircase(n)
  to_return = {}
    1.upto n do |crnt_size|
      next if crnt_size.even?
      all = Array.new(crnt_size) {|i| i + 1 }
      evens = all.select{|i| i.even? }
      to_return[crnt_size] = evens
    end
    to_return
end

# defined that to_return us a hash
# identified the range from 1 up to the number given
# lns 13/14 will select the odd numbers (i.e. skipping even ones by using next)
# from the range and put them into the hash 'to_return'. The keys have now been assigned.
# all (ln 15) is the creation of an array in which the even numbers are put back
# we now have an array populated with all of the numbers from 1 to n.
# evens uses the 'all' array and selects the values that are even.
# ln 17 then assigns the array called crnt_size to be equal to evens.
# i.e. contian only even numbers from 1 to n.
# This array is the values for the hash.
# ln 19 then returns the hash containing the keys(ln13/14) and the corresponding
# values (the array crnt_size created by evens)
