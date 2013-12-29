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
    player:resetPlayer( target );
end