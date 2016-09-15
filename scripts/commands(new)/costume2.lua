---------------------------------------------------------------------------------------------------
-- func: costume
-- desc: Sets the players current costume.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "i"
};

function onTrigger(player, costume)
    player:timer(500, function(player) player:costume2(math.random(0,2800))end)
end