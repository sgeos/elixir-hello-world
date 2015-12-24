defmodule HelloWorld.Application do
  use Application

  def start(_type, _args) do
    {:ok, pid} = Task.Supervisor.start_link()
    Task.Supervisor.async(pid, __MODULE__, :main, [args])
    {:ok, pid}
  end

  def main([]), do: main ["--name=#{"USER" |> System.get_env }"]
  def main(args), do: Mix.Project.get.project[:escript][:main_module].main(args)
  def args(), do: System.argv
end

