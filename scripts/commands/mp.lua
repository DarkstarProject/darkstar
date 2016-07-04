---------------------------------------------------------------------------------------------------
-- func: @mp <amount> <player>
-- desc: Sets the GM or target players mana.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "is"
};

function onTrigger(player, mp, target)
    if (mp == nil) then
        player:PrintToPlayer("You must enter a valid amount.");
        player:PrintToPlayer( "@mp <amount> <player>" );
        return;
    end

    if (target == nil) then
        player:setMP(mp);
    else
        local targ = GetPlayerByName(target);
        if (targ ~= nil) then
            targ:setMP(mp);
        else
            player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
            player:PrintToPlayer( "@mp <amount> <player>" );
        end
    end
end;