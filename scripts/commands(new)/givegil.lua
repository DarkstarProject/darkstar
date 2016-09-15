---------------------------------------------------------------------------------------------------
-- func: @givegil <amount> <player>
-- desc: Gives the specified amount of gil to GM or target player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "is"
};

function onTrigger(player, amount, target)
    if (amount == nil) then
        player:PrintToPlayer("You must enter a valid amount.");
        player:PrintToPlayer( "@givegil <amount> <player>" );
        return;
    end

    if (target == nil) then
        player:addGil(amount);
    else
        local targ = GetPlayerByName(target);
        if (targ ~= nil) then
            targ:addGil(amount);
        else
            player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
            player:PrintToPlayer( "@givegil <amount> <player>" );
        end
    end
end;