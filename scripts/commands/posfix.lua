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
    player:resetPlayer( targ );
    player:PrintToPlayer("Done.");
end;