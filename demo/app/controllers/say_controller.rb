class SayController < ApplicationController
  def hello
    @time = Time.now
  end

  def goodbye
  end

  def play
    @files = Dir.glob("*")
  end
end
