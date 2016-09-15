---------------------------------------------------------------------------------------------------
-- func: entityVisual
-- desc: push entityVisual packet to player
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, visualstring)
    if (visualstring ~= nil) then
        player:entityVisualPacket(visualstring);
    else
        player:PrintToPlayer("You must enter a valid animation string.");
    end
end