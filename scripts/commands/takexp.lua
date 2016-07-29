---------------------------------------------------------------------------------------------------
-- func: @takexp <amount> <player>
-- desc: Removes experience points from the target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "is"
};

function onTrigger(player, amount, target)
    -- print( 'Exp amount: ' .. tostring( amount ) );
    if (amount == nil) then
        player:PrintToPlayer( "You must enter a valid point amount." );
        player:PrintToPlayer( "@takexp <amount> <player>" );
        return;
    end

    if (target == nil) then
        player:delExp(amount);
        player:PrintToPlayer( string.format( "Removed %i exp from self. ", amount ) );
    else
        local targ = GetPlayerByName(target);
        if (targ ~= nil) then
            targ:delExp(amount);
            player:PrintToPlayer( string.format( "Removed %i exp from player '%s' ", amount, target ) )
        else
            player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
            player:PrintToPlayer( "@takexp <amount> <player>" );
        end
    end
end;