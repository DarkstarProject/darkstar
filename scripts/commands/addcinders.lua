---------------------------------------------------------------------------------------------------
-- func: @addcinders <amount> <player>
-- auth: Forgottenandlost
-- desc: Adds the specified Cinders to the player
---------------------------------------------------------------------------------------------------

cmdprops =
{
	permission = 1,
	parameters = "is"
};

function onTrigger(player,amount,target)

    if (amount == nil) then
        player:PrintToPlayer( "You must enter a valid point amount." );
        player:PrintToPlayer( "@addcinders <amount> <player>" );
        return;
    end

    if (target == nil) then
        player:addCinders(amount);
    else
        local targ = GetPlayerByName(target);
        if (targ ~= nil) then
            targ:addCinders(amount);
        else
            player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
            player:PrintToPlayer( "@addcinders <amount> <player>" );
        end
    end
end;