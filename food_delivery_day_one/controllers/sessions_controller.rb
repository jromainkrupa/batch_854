require_relative "../views/session_view"

class SessionsController
  def initialize(employee_repository)
    @employee_repository = employee_repository
    @session_view = SessionView.new

  end

  def sign_in
    # 1 . demander un username
    username = @session_view.ask_for("username")
    # 2. Demander un password
    password = @session_view.ask_for("password")
    # 3. verifier que le couple username password marche
    employee = @employee_repository.find_by_username(username)
    return employee if employee.password == password
    # 4. si le couple ne marche pas, on demande de recommencer
    @session_view.wrong_credentials
    sign_in
  end

  private

  def password_and_username_matches?(username, password)
    return employee.password == password unless employee.nil?
    false
  end
end

# Fibonacci
# 1, 1, 2, 3, 5, 8, 13
# 0  1  2  3  4  5

# fibonaci(5) => 8
# fibonaci(6) => 13

# def fibonaci(number)
#   return 1 if number 0 || 1

#   result = fibonaci(number - 1) + fibonaci(n-2)
#   return result

# end
