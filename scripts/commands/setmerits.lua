---------------------------------------------------------------------------------------------------
-- func: @setmerits <amount> <player>
-- desc: Sets the target players merit count.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "is"
};

function onTrigger(player, amount, target)
    if (amount == nil) then
        player:PrintToPlayer("You must enter a valid amount.");
        player:PrintToPlayer( "@setmerits <amount> <player>" );
        return;
    end

    if (target == nil) then
        player:setMerits( amount );
    else
        local targ = GetPlayerByName(target);
        if (targ ~= nil) then
            targ:setMerits( amount );
        else
            player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
            player:PrintToPlayer( "@setmerits <amount> <player>" );
        end
    end
end;