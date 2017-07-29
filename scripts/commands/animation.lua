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
    if (animationId == nil) then
        player:PrintToPlayer( string.format( "Current player animation: %d", player:getAnimation() ) );
        return;
    end

    animationId = tonumber(animationId) or _G[string.upper(animationId)];

    player:setAnimation( animationId );
end
