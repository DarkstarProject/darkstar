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
    player:costume2( costume );
end