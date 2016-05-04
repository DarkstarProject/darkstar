---------------------------------------------------------------------------------------------------
-- func: animation
-- desc: Sets the players current animation.
---------------------------------------------------------------------------------------------------

require("scripts/globals/status");

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, animationId)

    animationId = tonumber(animationId) or _G[animationId];
    
    if (animationId == nil) then
        player:PrintToPlayer( string.format( "Current player animation: %d", player:getAnimation() ) );
        return;
    end

    player:setAnimation( animationId );
end