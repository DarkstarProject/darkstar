---------------------------------------------------------------------------------------------------
-- func: messagebasic
-- desc: Injects a message basic packet.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iii"
};

function onTrigger(player, msgId, param1, param2)
    player:messageBasic(msgId, param1, param2);
end