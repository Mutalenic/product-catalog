require_relative './classes/app'

def main
  app = App.new
  loop do
    app.start
  end
end

main
