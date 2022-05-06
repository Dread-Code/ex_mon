defmodule ExMon.Game.Status do
  def print_round_message(%{status: :started} = info) do
    IO.puts("\n====== The Game is Started ======\n")
    IO.inspect(info)
    IO.puts("---------------------------------------------")
  end
  def print_round_message(%{status: :continue, turn: player} = info) do
    IO.puts("\n====== It's #{player} turn. ======\n")
    IO.inspect(info)
    IO.puts("---------------------------------------------")
  end
  def print_round_message(%{status: :game_over} = info) do
    IO.puts("\n====== The Game is over ======\n")
    IO.inspect(info)
    IO.puts("---------------------------------------------")
  end

  def print_wrong_message(move) do
    IO.puts("\n====== Invalid Move: #{move}======\n")
  end

  def print_move_message(:computer, :attack, damage) do
    IO.puts("\n====== The player attacked the computer dealing #{damage} damage ======\n")
  end
  def print_move_message(:player, :attack, damage) do
    IO.puts("\n====== The computer attacked the player dealing #{damage} damage ======\n")
  end
  def print_move_message(player, :heal, life, heal_restored) do
    IO.puts("\n====== The #{player} restored #{heal_restored} of his life. #{player} life: #{life} ======\n")
  end
end
