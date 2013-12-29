---------------------------------------------------------------------------------------------------
-- func: setmerits
-- auth: <Unknown>
-- desc: Sets the players current merit count.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "i"
};

function onTrigger(player, amount)
    if (amount == nil) then
        player:PrintToPlayer("You must enter a valid amount.");
        return;
    end
    player:setMerits( amount );
end