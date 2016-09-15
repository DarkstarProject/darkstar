---------------------------------------------------------------------------------------------------
-- func: homepoint
-- desc: Sends the target to their homepoint.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, target)
    if (target == nil) then
        target = player:getName();
    end

    local targ = GetPlayerByName( target );
    if (targ ~= nil) then
        targ:warp();
    else
        player:PrintToPlayer( string.format( "Player named '%s' not found!", target ) );
    end
end