---------------------------------------------------------------------------------------------------
-- func: cs
-- desc: Starts the given event for the player.
---------------------------------------------------------------------------------------------------

cmdprops =
{
    permission = 1,
    parameters = "ssssssssss"
};

function onTrigger(player, csid, op1, op2, op3, op4, op5, op6, op7, op8, texttable)
    if (csid == nil) then
        player:PrintToPlayer("You must enter a cutscene id.");
        return;
    end
    
    if (op1 == nil) then
        player:startEvent(csid);
    else    
        player:startEvent(csid, op1, op2, op3, op4, op5, op6, op7, op8, texttable);
    end
end
