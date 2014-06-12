---------------------------------------------------------------------------------------------------
-- func: @delcinders <amount> <player>
-- auth: Forgottenandlost
-- desc: Deletes the specified amount of Cinders from the player
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "is"
};

function onTrigger(player,amount,target)

    if (amount == nil) then
        player:PrintToPlayer( "You must enter a valid point amount." );
        player:PrintToPlayer( "@delcinders <amount> <player>" );
        return;
    end

    if (target == nil) then
        player:delCinders(amount);
    else
        local targ = GetPlayerByName(target);
        if (targ ~= nil) then
            targ:delCinders(amount);
        else
            player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
            player:PrintToPlayer( "@delcinders <amount> <player>" );
        end
    end
end;