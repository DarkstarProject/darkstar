---------------------------------------------------------------------------------------------------
-- func: injectaction
-- desc: Injects an action packet with the specified action and animation id.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iiiii"
};

function onTrigger(player, actionId, animationId, speceffect, reaction, message)
    if (message == nil) then
        message = 185; -- Default message
    end
    player:injectActionPacket(actionId, animationId, speceffect, reaction, message);
end
