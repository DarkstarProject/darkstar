---------------------------------------------------------------------------------------------------
-- func: @takegil <amount> <player>
-- desc: Removes the amount of gil from the given player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "is"
};

function onTrigger(player, amount, target)
    if (amount == nil) then
        player:PrintToPlayer("You must enter a valid amount.");
        player:PrintToPlayer( "@takegil <amount> <player>" );
        return;
    end

    if (target == nil) then
        player:delGil(amount);
        player:PrintToPlayer( string.format( "Removed %i gil from self. ", amount ) );
    else
        local targ = GetPlayerByName(target);
        if (targ ~= nil) then
            targ:delGil(amount);
            player:PrintToPlayer( string.format( "Removed %i gil from player '%s' ", amount, target ) )
        else
            player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
            player:PrintToPlayer( "@takegil <amount> <player>" );
        end
    end
end;