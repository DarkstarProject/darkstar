-----------------------------------------------------------------------
-- func: @reset <player>
-- desc: If no name is specified, resets your own JA timers.
-- If a player name is specified, resets all of that players JA timers.
-----------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player,target)
    if (target == nil) then
        player:resetRecasts();
    else
        local targ = GetPlayerByName(target);
        if (targ ~= nil) then
            targ:resetRecasts();
        else
            player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        end
    end
end;