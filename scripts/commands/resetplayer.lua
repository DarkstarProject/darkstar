---------------------------------------------------------------------------------------------------
-- func: resetplayer
-- auth: Link
-- desc: Resets a targets account session and warps them to Jeuno.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, target)
    if (target == nil) then
        player:PrintToPlayer("You must enter a valid Character name.");
        return;
    end
    player:resetPlayer( target );
end
