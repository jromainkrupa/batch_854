require_relative 'base_view'

class SessionView < BaseView
  def wrong_credentials
    puts "wrong credentials!"
  end

  def too_many_attempts
    puts "too many attempts!"
  end
end
