---------------------------------------------------------------------------------------------------
-- func: @delscylds <amount> <player>
-- auth: Forgottenandlost
-- desc: Deletes the specified amount of Scylds from the player
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "is"
};

function onTrigger(player,amount,target)

    if (amount == nil) then
        player:PrintToPlayer( "You must enter a valid point amount." );
        player:PrintToPlayer( "@delscylds <amount> <player>" );
        return;
    end

    if (target == nil) then
        player:delScylds(amount);
    else
        local targ = GetPlayerByName(target);
        if (targ ~= nil) then
            targ:delScylds(amount);
        else
            player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
            player:PrintToPlayer( "@delscylds <amount> <player>" );
        end
    end
end;