require './classes/startup'

def main
  app = Startup.new
  loop do
    app.start
  end
end

main
