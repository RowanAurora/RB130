require 'MiniTest/autorun'
require_relative 'cash_register'
require_relative 'transaction'


class CashRegisterTest < MiniTest::Test
  
  def test_accept_money
    reg = CashRegister.new(500)
    trans = Transaction.new(250)
    trans.amount_paid = 250
    previous_amount = reg.total_money
    reg.accept_money(trans)
    current_amount = reg.total_money
    assert_equal(previous_amount + 250, current_amount)
  end
  
  def test_change
    reg = CashRegister.new(500)
    trans = Transaction.new(250)
    trans.amount_paid = 300
    assert_equal(50, reg.change(trans))
  end
  
  def test_give_receipt
    reg = CashRegister.new(500)
    trans = Transaction.new(250)
    trans.amount_paid = 300
    
    assert_output("You've paid $#{trans.item_cost}.\n") { reg.give_receipt(trans) }
  end
  
  # def test_prompt_for_payment
  #   trans = Transaction.new(250)
  #   input = StringIO.new("250\n")
  #   assert_output("You owe $250.\nHow much are you paying?\n") {trans.prompt_for_payment(input: input)}
  #   assert_equal 250, trans.amount_paid
  # end

  def test_prompt_for_payment
    trans = Transaction.new(250)
    input = StringIO.new("250")
    output = StringIO.new
    trans.prompt_for_payment(input: input, output: output)
    assert_equal 250, trans.amount_paid
  end
end