---------------------------------------------------------------------------------------------------
-- func: inject
-- desc: Injects the given packet data.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "s"
};

function onTrigger(player, packet)
    if (packet == nil) then
        player:PrintToPlayer("You must enter a packet file name.");
        return;
    end

    player:injectPacket( packet );
end