---------------------------------------------------------------------------------------------------
-- func: @posfix
-- auth: Link (as "resetplayer"), Modified by TeoTwawki.
-- desc: Resets a targets account session and warps them to Jeuno.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, target)
    if (target == nil) then -- This only prints if no target was specified at all.
        player:PrintToPlayer("You must enter a valid Character name.");
        return;
    end

    local targ = GetPlayerByName(target);
    if (targ == nil) then -- This only prints if a target was specified but that target didn't exist.
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
        return;
    end

    player:resetPlayer( targ );
end;