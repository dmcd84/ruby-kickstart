# Write a method, match_maker, which will receive an unknown number of
# elements, and return an array where every two elements are represented by true or false.
#
# The very first parameter will not be part of this set. Instead, it will tell
# you how to determine what their value should be.
# If it is true, then they will be true when they are oppositely truthy.
# If it is false, then they will be true when they are similarly truthy.
#
# Examples:
# match_maker false, true,  true                # => [true]
# match_maker true,  true,  true                # => [false]
# match_maker true,  false, false               # => [false]
# match_maker true,  false, true                # => [true]
# match_maker true,  true,  false               # => [true]
# match_maker true,  true,  true, false, true   # => [false, true]
# match_maker true,  true,  true, false, nil    # => [false, false]
# match_maker true,  true,  true, true, nil     # => [false, true]
# match_maker true,  true,  true, 0, nil        # => [false, true]

def match_maker(opposites_attract, *elements)
  to_return = []
  elements.each_slice 2 do |first, last|
    first = !!first
    last = !!last
    result = if opposites_attract
      first != last
    else
      first == last
    end
    to_return << result
  end
  to_return
end

# ln 21 to_return array is created.
# as each time the method is called only two elements are to be considered at a time
# so the slice method can be used to 'cut' the elements into pairs.
# lns 23 and 24 identify variables as not not by using the double bang.
# a result can be declared to be fed to the awaiting array in ln 30 by using an if
# statement. opposites_attract give the argument of true or false, so the if statement
# allows the two elements to be compared to each other and the logic arguement.
# the double bang is needed so that the element can be returned as either true or false
# if only one bang is used this will be the opposite i.e. false. If the case was
# first = first then this would always return true. The double bang being not not
# true or false, means that the returned logical arguement can be changed rather than
# being returned as the same logical arguement each time.
