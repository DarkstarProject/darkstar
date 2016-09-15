---------------------------------------------------------------------------------------------------
-- func: costume
-- desc: Sets the players current costume.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, costume)
    player:costume( costume );
end