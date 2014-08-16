defmodule Apex.Test do
  use ExUnit.Case
  import Apex
  import ExUnit.CaptureIO

  test "#ap" do
    capture_io(fn -> ap(~w(a b c d), color: false) end) == """
    [
      [0] "a"
      [1] "b"
      [2] "c"
      [3] "d"
    ]

    """
  end

  test "#apd with PID" do
    sio = StringIO.open("") |> elem(1)
    apd(sio, ~w(a b c d), color: false)
    StringIO.close(sio) |> elem(1) |> elem(1) == """
    [
      [0] "a"
      [1] "b"
      [2] "c"
      [3] "d"
    ]

    """
  end

  test "#apd with named device" do
    capture_io(:stderr, fn -> apd(:stderr, ~w(a b c d), color: false) end) == """
    [
      [0] "a"
      [1] "b"
      [2] "c"
      [3] "d"
    ]

    """
  end
end
