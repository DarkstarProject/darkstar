---------------------------------------------------------------------------------------------------
-- func: cs2
-- desc: Starts the given event for the player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "sssssiiiiiiii"
};

function onTrigger(player, csid, string1, string2, string3, string4, op1, op2, op3, op4, op5, op6, op7, op8)
    if (csid == nil) then
        player:PrintToPlayer("You must enter a cutscene id.");
        return;
    end
    player:startEventString(csid, string1, string2, string3, string4, op1, op2, op3, op4, op5, op6, op7, op8);
end