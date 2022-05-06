defmodule ExMon.Game.Actions.Heal do
  @move_heal 5..15

  alias ExMon.Game
  alias ExMon.Game.Status
  def heal(player) do
    heal = calculate_heal()
    player
    |> Game.fetch_player
    |> Map.get(:life)
    |> calculate_total_life(heal)
    |> update_heal_player(player, heal)
  end

  def calculate_heal, do: Enum.random(@move_heal)
  def calculate_total_life(life, heal), do: life + heal

  def update_heal_player(life, player, heal_restored) when life > 100, do: update_heal_player(100, player, heal_restored)
  def update_heal_player(life, player, heal_restored) do
    player
    |> Game.fetch_player
    |> Map.put(:life,  life)
    |> update_game(player, life, heal_restored)
  end

  def update_game(state, player, life, heal_restored) do
    Game.info
    |> Map.put(player, state)
    |> Game.update

    Status.print_move_message(player, :heal, life, heal_restored)
  end
end
