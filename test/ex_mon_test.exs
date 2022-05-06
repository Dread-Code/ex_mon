defmodule ExMonTest do
  use ExUnit.Case

  alias ExMon.Player

  import ExUnit.CaptureIO

  describe "create_player/4" do
    test "returns a player" do
      expect_response = %ExMon.Player{
        life: 100,
        moves: %{move_avg: :kick, move_heal: :heal, move_rnd: :punch},
        name: "Lucas"
      }
      Player.build("Lucas", :kick, :punch, :heal)

      assert expect_response == ExMon.create_player("Lucas", :kick, :punch, :heal)
    end
  end

  # describe "start_game/1" do
  #   test "when the game is started, return a message" do
  #     player = ExMon.create_player("Lucas", :kick, :punch, :heal)

  #     messages =
  #       capture_io(fn ->
  #         assert ExMon.start_game(player) == :ok
  #       end)
  #     # =~(option + "+") Check if the content compared exist in al the message output
  #     assert messages =~ "The Game is Started"
  #     assert messages =~ "status: :started"
  #     assert messages =~ "turn: :player"
  #   end
  # end

  describe "make_move/1" do
    test "When the move is valid, the player an CPU sould made it" do
      player = ExMon.create_player("Lucas", :kick, :punch, :heal)
      ExMon.start_game(player)

      messages =
        capture_io(fn ->
          assert ExMon.make_move(:punch) == :ok
        end)

      assert messages =~ "The player attacked the computer"
    end
  end
end
