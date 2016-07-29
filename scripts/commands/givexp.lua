---------------------------------------------------------------------------------------------------
-- func: @givexp <amount> <player>
-- desc: Gives the GM or target player experience points.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "is"
};

function onTrigger(player, amount, target)
    if (amount == nil or amount <= 0) then
        player:PrintToPlayer("You must enter a valid amount.");
        player:PrintToPlayer( "@givexp <amount> <player>" );
        return;
    end

    if (target == nil) then
        player:addExp(amount);
        -- print( 'Exp amount: ' .. tostring( amount ) );
    else
        local targ = GetPlayerByName(target);
        if (targ ~= nil) then
            targ:addExp(amount);
            -- print( 'Exp amount: ' .. tostring( amount ) );
            player:PrintToPlayer( string.format( "Gave %i exp to player '%s' ", amount, target ) );
        else
            player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
            player:PrintToPlayer( "@givexp <amount> <player>" );
        end
    end
end;