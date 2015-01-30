---------------------------------------------------------------------------------------------------
-- func: @posfix
-- auth: Link (as "resetplayer"), renamed by TeoTwawki.
-- desc: Resets a targets account session and warps them to Jeuno.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, target)
    if (target == nil) then
        player:PrintToPlayer("Derp? Need a name Buddy.");
    else
        player:resetPlayer( target );
        player:PrintToPlayer("Done.");
    end
end;