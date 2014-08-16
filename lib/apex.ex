defmodule Apex do
  @moduledoc "Elixir clone of the awesome_print gem"

  @doc """
    Pretty prints the supplied data
  """
  def ap(data, options \\ []) do
    apd(:erlang.group_leader(), data, options)
  end

  def apd(device, data, options \\ []) do
    IO.puts(device, Apex.Format.format(data, options))
  end
end
