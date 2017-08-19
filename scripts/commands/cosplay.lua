---------------------------------------------------------------------------------------------------
-- func: costume
-- auth: <Unknown>
-- desc: Sets the players current costume.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 0,
    parameters = "i"
};

function onTrigger(player, costume)
    player:costume( costume );
end