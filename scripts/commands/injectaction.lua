---------------------------------------------------------------------------------------------------
-- func: injectaction
-- desc: Injects an action packet with the specified action and animation id.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 5,
    parameters = "ii"
};

function onTrigger(player, actionId, animationId)
    player:injectActionPacket( actionId, animationId );
end