require 'minitest/autorun'
require_relative '../tasks'
require_relative '../chore'


class TasksTest < Minitest::Test 
  def setup
    @tasks_app = Tasks.new
  end



  def capture_stdout
    original_stdout = $stdout
    $stdout = StringIO.new
    yield
    $stdout.string
  ensure
    $stdout = original_stdout
  end

  def test_motivation
    output = capture_stdout {@tasks_app.motivation}
    quotes = ["A clean home is a happy home!",
    "Doing chores now means more time for fun later!",
    "Every little step helps. Start small and keep going!",
    "A tidy space leads to a tidy mind.",
    "Think of the satisfaction you'll feel once it's done!",
    "Cleanliness is next to happiness!",
    "Small efforts add up to big results.",
    "Chores done today means relaxation tomorrow!",
    "You'll feel so accomplished after finishing!",
    "Imagine how great it'll be to have everything clean!"]

    assert_includes quotes, output.strip, "Not found in the list of quotes."
  end
  
  def teardown
    $stdin = STDIN
  end
end
