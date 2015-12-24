defmodule HelloWorld.Application do
  use Application

  def start(_type, _args) do
    {:ok, pid} = Task.Supervisor.start_link()
    Task.Supervisor.async(pid, HelloWorld, :main, [["--name=#{"USER" |> System.get_env }"]])
    {:ok, pid}
  end
end

