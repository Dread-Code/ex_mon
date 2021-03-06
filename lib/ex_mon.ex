defmodule ExMon do
  alias ExMon.{Player, Game}
  alias ExMon.Game.{Status, Actions}

  @computer_name "CPU"
  @computer_moves [:move_avg, :move_rnd, :move_heal]

  def create_player(name, move_avg, move_rnd, move_heal) do
    Player.build(name, move_rnd, move_avg, move_heal)
  end

  def start_game(player) do
    @computer_name
    |> create_player(:kick, :punch, :heal)
    |> Game.start(player)
    Status.print_round_message(Game.info)
  end

  def make_move(move) do
    Game.info()
    |> Map.get(:status)
    |> handle_status(move)
  end

  def handle_status(:game_over, _move), do: Status.print_round_message(Game.info())
  def handle_status(_other, move) do
    move
    |> Actions.fetch_move
    |> do_move

    computer_move(Game.info)
  end

  defp do_move({:error, move}), do: Status.print_wrong_message(move)
  defp do_move({:ok, move}) do
    case move do
      :move_heal -> Actions.heal
      move -> Actions.attack(move)
    end

    Status.print_round_message(Game.info)
  end

  defp computer_move(%{status: :continue, turn: :computer}) do
    move = {:ok, Enum.random(@computer_moves)}
    do_move(move)
  end
  defp computer_move(_), do: :ok

end
