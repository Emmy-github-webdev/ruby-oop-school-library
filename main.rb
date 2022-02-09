require_relative 'input-output/input_output_operation'

def main
  optionselected = DisplayMenuOptions.new
  loop do
    optionselected.menu
    user_choice = gets.chomp.to_i

    optionselected.option(user_choice)
    break if user_choice == 7
  end
end

main
