defmodule LivebookEnvTest do
  use ExUnit.Case
  doctest LivebookEnv

  test "greets the world" do
    assert LivebookEnv.hello() == :world
  end
end
