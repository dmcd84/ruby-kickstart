# You have software to take payment from a customer
# There are 4 ways to pay, and they are all very similar.
# One day, you are paying by cash, and you realize you never calculated the tax!
# So you went in to your code and added order.compute_tax to the pay_by_cash method.
# Everything was great, until you realized you forgot to add it to pay_by_check also!
#
# You fixed this bug already, but the same code is duplicated in many places,
# so the bug fix didn't get everything. Frustrated, you decide to refactor your code.
#
# You see a lot of duplciation, but unfortunately, right in the middle of each of these
# pieces of code, is a line or two that changes every time.
#
# Thinking a little bit, you realize that you could create a method that performs this
# boiler plate code, then calls a block which does the custom code.
#
# You decide to name it pay_by.
#
# **Create the pay_by method, and refactor each of the four methods below such that they
# invoke the pay_by method, and pass it the order, to take care of the code that is all the same
# Let them pass a block to take care of the code that is unique.**
#
# NOTE: This code will only work with the rake tests, which will define the order and current_user
# you will not be able to run this code outside of the test

def pay_by(order)
  order.compute_cost
  order.compute_shipping
  order.compute_tax
  yield
  order.ship_goods
end

def pay_by_visa(order, ccn)
  pay_by order do
  order.payment :type => :visa, :ccn => ccn
  order.verify_payment
end
end

def pay_by_check(order)
  pay_by(order) { order.payment :type => :check, :signed => true }
end

def pay_by_cash(order)
  pay_by(order) { order.payment :type => :cash }
end

def pay_by_store_credit(order, current_user)
  pay_by(order) do
  order.payment :type => :store_credit
  current_user.store_credit -= order.cost   # current_user is a method with no params (ie, the customer)
end
end




# each of the individual payment method methods has been reduced in size.
# the common three steps at the beginning of each of the methods has been
# replaced with a new method of its own. This is a good example of DRY.
# DRY = Don't Repeat Yourself.
# rather then having compute_cost, compute_shipping and compute_tax. These three
# methods have now been combined into the pay_by method. Additionally, the yield
# in the pay_by method allows the second part of the other payment method methods
# to be exectued before returning to the pay_by method to the ship the goods.
# The ship_goods can also be removed from each method and applied to the pay_by
# method as this is a common step among all of the individual methods.
# This makes the whole process smaller and more efficient.
