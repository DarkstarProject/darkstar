---------------------------------------------------------------------------------------------------
-- func: @servmsg
-- auth: Ron
-- desc: Prints a message to the whole server!
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "iiii"
};

function onTrigger(player, message)
    if (message == nil) then
        player:PrintToPlayer("You must enter a message to send to everyone.");
        return;
    end

    player:PrintToServer(string.format("MSG FROM VRTRAGM: %s", message), 0x1C);
end