---------------------------------------------------------------------------------------------------
-- func: @addscylds <amount> <player>
-- auth: Forgottenandlost
-- desc: Adds the specified Scylds to the player
---------------------------------------------------------------------------------------------------

cmdprops =
{
	permission = 1,
	parameters = "is"
};

function onTrigger(player,amount,target)

    if (amount == nil) then
        player:PrintToPlayer( "You must enter a valid point amount." );
        player:PrintToPlayer( "@addscylds <amount> <player>" );
        return;
    end

    if (target == nil) then
        player:addScylds(amount);
    else
        local targ = GetPlayerByName(target);
        if (targ ~= nil) then
            targ:addScylds(amount);
        else
            player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
            player:PrintToPlayer( "@addscylds <amount> <player>" );
        end
    end
end;