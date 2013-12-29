---------------------------------------------------------------------------------------------------
-- func: givegil
-- auth: Link
-- desc: Gives the amount of gil to the given player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "si"
};

function onTrigger(player, target, amount)
    if (target == nil) then
        player:PrintToPlayer("You must enter a valid player name.");
        return;
    end

    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
        if (amount == nil) then
            amount = 0;
        end
        targ:addGil( amount );
    else
        player:PrintToPlayer( string.format( "Invalid player '%s' given.", target ) );
    end
end