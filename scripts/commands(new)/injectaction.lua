---------------------------------------------------------------------------------------------------
-- func: injectaction
-- desc: Injects an action packet with the specified action and animation id.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iiii"
};

function onTrigger(player, actionId, animationId, speceffect, reaction)
    player:injectActionPacket( actionId, animationId, speceffect, reaction );
end
