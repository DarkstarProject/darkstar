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
    if (mob == nil and animationId == nil) then
        player:PrintToPlayer( "A mob ID and Animation ID must be specified." );
        return;
    end

    animationId = tonumber(animationId) or _G[string.upper(animationId)];

    local mob = GetMobByID( target );
    mob:AnimationSub( animationId );
end
