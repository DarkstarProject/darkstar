---------------------------------------------------------------------------------------------------
-- func: setgil
-- desc: Sets the players gil.
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
    player:setGil( amount );
end;