---------------------------------------------------------------------------------------------------
-- func: @getid
-- auth: TeoTwawki
-- desc: Prints the ID of the currently selected target under the cursor
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = ""
};

function onTrigger(player)
    local targ = player:getCursorTarget();
    if (targ ~= nil) then
        player:PrintToPlayer(string.format("Selected Target's ID is: %u ", targ:getID()));
    else
        player:PrintToPlayer("Must select a target using in game cursor first.");
    end
end;
