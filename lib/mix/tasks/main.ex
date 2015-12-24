defmodule Mix.Tasks.Main do
  use Mix.Task
  alias HelloWorld.Mixfile

  def run(args) do
    Mixfile.project[:escript][:main_module].main(args) 
  end
end

