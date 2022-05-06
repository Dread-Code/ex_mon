defmodule ExMon.GameTest do
  use ExUnit.Case

  alias ExMon.{Game, Player}

  # describe "start/2" do
  #   test "starts the game state" do
  #     player = Player.build("Lucas", :kick, :punch, :heal)
  #     computer = Player.build("CPU", :kick, :punch, :heal)

  #     assert {:ok, _pid} = Game.start(computer, player)
  #   end
  # end

  # describe "info/0" do
  #   test "returns the current game state" do
  #     player = Player.build("Lucas", :kick, :punch, :heal)
  #     computer = Player.build("CPU", :kick, :punch, :heal)

  #     Game.start(computer, player)

  #     expected_response = %{
  #       computer: %Player{
  #         life: 100,
  #         moves: %{move_avg: :kick, move_heal: :heal, move_rnd: :punch},
  #         name: "CPU"
  #       },
  #       player: %Player{
  #         life: 100,
  #         moves: %{move_avg: :kick, move_heal: :heal, move_rnd: :punch},
  #         name: "Lucas"
  #       },
  #       status: :started,
  #       turn: :player
  #     }

  #     assert expected_response == Game.info()
  #   end
  # end
end
