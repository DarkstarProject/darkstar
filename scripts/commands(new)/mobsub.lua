---------------------------------------------------------------------------------------------------
-- func: mobsub
-- desc: Changes the sub-animation of the given mob. (For testing purposes.)
---------------------------------------------------------------------------------------------------

require("scripts/globals/status");

cmdprops =
{
    permission = 1,
    parameters = "ss"
};

function onTrigger(player, target, animationId)
    
    animationId = tonumber(animationId) or _G[animationId];
    
    local mob = GetMobByID( target );
    if (mob ~= nil and animationId ~= nil) then
        mob:AnimationSub( animationId );
    else
        player:PrintToPlayer( "A mob ID and Animation ID must be specified." );
    end
end