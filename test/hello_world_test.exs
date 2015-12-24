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

  test "application hello world" do
    assert capture_io(fn ->
      HelloWorld.Application.main []
    end) == "Hello, World!\n"
  end

  test "application hello user" do
    assert capture_io(fn ->
      HelloWorld.Application.main ["--name=User"]
    end) == "Hello, User!\n"
  end

  test "application terminates" do
    {:ok, pid} = HelloWorld.Application.start(nil, nil)
    %Task{ref: ref} = HelloWorld.Application.main_task(pid)
    assert_receive {:DOWN, ^ref, :process, _, :normal}, 100
  end
end

