---------------------------------------------------------------------------------------------------
-- func: mobsub
-- desc: Changes the sub-animation of the given mob. (For testing purposes.)
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ii"
};

function onTrigger(player, target, animationId)
    local mob = GetMobByID( target );
    if (mob ~= nil and animationId ~= nil) then
        mob:AnimationSub( animationId );
    else
        player:PrintToPlayer( "A mob ID and Animation ID must be specified." );
    end
end