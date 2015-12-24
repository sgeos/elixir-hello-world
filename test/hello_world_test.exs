defmodule HelloWorldTest do
  use ExUnit.Case
  doctest HelloWorld

  import ExUnit.CaptureIO

  test "true" do
    assert true == true
  end

  test "hello world" do
    assert capture_io(fn ->
      HelloWorld.main []
    end) == "Hello, World!\n"
  end

  test "hello user" do
    assert capture_io(fn ->
      HelloWorld.main ["--name=User"]
    end) == "Hello, User!\n"
  end

  #test "application" do
  #  assert capture_io(fn ->
  #    HelloWorld.Application.start(nil, nil)
  #  end) == "Hello, #{"USER" |> System.get_env}!\n"
  #end
end

