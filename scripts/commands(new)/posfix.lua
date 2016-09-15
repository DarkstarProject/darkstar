---------------------------------------------------------------------------------------------------
-- func: @posfix
-- desc: Resets a targets account session and warps them to Jeuno.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, target)
    if (target == nil) then
        player:PrintToPlayer("An offline player name must be specified.");
    else
        player:resetPlayer( target );
        player:PrintToPlayer("Done.");
    end
end;