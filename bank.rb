# The virtual banking app

class App

   #attr_reader :name, :balance
    @@attempts = 1
  def initialize(name, pin, balance)
    @name = name
    @pin = pin
    @balance = balance
  end

  def state



    puts "Pleace confirm your pin! :> "
    pin_verify = gets.chomp


    if pin_verify == @pin
      puts "-*-" * 10
      puts "#{@name} your balance is: #{@balance}"
      puts "-*-" * 10
      print "When you are ready press Enter: "
      pouse = gets.chomp
      puts "-*-" * 10
      NewUser.mine_loop

    elsif @pin_verify != @pin and @@attempts < 3
      puts "Incorrect PIN try again :>"
      print "This is your #{@@attempts} try you have ", (3 - @@attempts), " more left!"
      @@attempts += 1
      state

    elsif pin_verify != @pin or @@attempts > 3
      puts "-*-" * 10
      puts "Too may attempts your account is blocked"
      puts "Pleace visit your nearest bank branch to unlock it"
      exit!()

    else
      state
    end
  end

  def cash
    print "Pleace confirm your pin! :> "
    pin_verify = gets.chomp
    if pin_verify == @pin
      print "Pleace enter the ammount you wish to withdraw: "
      get_cash = gets.chomp
      if get_cash >= @balance
        puts "Not enougth money in your bank acc pleace try with less"
        puts "Your account can't be 0. Otherwise we need to close it!"
        cash
      else
        puts "-*-" * 10
        puts "You withdraw #{get_cash} from your available balance #{@balance}"
        @balance = @balance.to_i - get_cash.to_i
        puts "Your new balance is: #{@balance} "
        print "When you are ready press Enter:> "
        pouse = gets.chomp
        puts "-*-" * 10
        NewUser.mine_loop
      end
    else pin_verify != @pin
      puts "Incorrect PIN try again :>"
      cash
    end
  end

  def deposit
    print "Pleace confirm your pin! :> "
    pin_verify = gets.chomp
    if pin_verify != @pin
      puts "Incorrect PIN try again :>"
      deposit
    else
      print "Pleace enter the ammount you wish to deposit: "
      deposit_cash = gets.chomp
      puts "-*-" * 10
      puts "You deposit #{deposit_cash} in your accoint with previous balance #{@balance}"
      @balance = deposit_cash.to_i + @balance.to_i
      puts "Your new balance is #{@balance}"
      print "When you are ready press Enter:> "
      pouse = gets.chomp
      puts "-*-" * 10
      NewUser.mine_loop
    end
  end
end

class NewUser < App

  def self.start

    puts 'Welcome to my banking'
    puts "Let's start by creating your accoint"
    print "What's your name ?:> "
    name = gets.chomp
    print "Set a password: "
    pin = gets.chomp
    print "Add start up balance: "
    balance = gets.chomp

    @acc = App.new(name, pin, balance)
    puts "-=-" * 10
    mine_loop
  end

  def self.mine_loop
      puts "What do you want to do next ?"
      puts "For balance press 1, to withdraw money press 2, to deposit 3 "
      puts "Exit press 4 "
      print ":> "
      choose = gets.chomp.to_i
      case choose
      when 1
        @acc.state
      when 2
        @acc.cash
      when 3
        @acc.deposit
      when 4
        exit!()
      else
        mine_loop
      end
    end

end

NewUser.start
