---------------------------------------------------------------------------------------------------
-- func: messagespecial
-- desc: Injects a message special packet.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iiiii"
};

function onTrigger(player, msgid, param1, param2, param3, param4, param5)
    if (param5 ~= nil) then
        player:messageSpecial(msgid, param1, param2, param3, param4, param5);
    elseif (param4 ~= nil) then
        player:messageSpecial(msgid, param1, param2, param3, param4);
    elseif (param3 ~= nil) then
        player:messageSpecial(msgid, param1, param2, param3);
    elseif (param2 ~= nil) then
        player:messageSpecial(msgid, param1, param2);
    elseif (param1 ~= nil) then
        player:messageSpecial(msgid, param1);
    else
        player:messageSpecial(msgid);
    end
end