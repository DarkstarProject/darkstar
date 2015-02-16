---------------------------------------------------------------------------------------------------
-- func: @door <NPC ID> <open/close>
-- auth: TeoTwawki
-- desc: open or close a door. Works on invisible elevator doors as well.
---------------------------------------------------------------------------------------------------

cmdprops =
{
	permission = 1,
	parameters = "is"
};

function onTrigger(player, npcID, state, duration)
    if (npcID == nil) then
        player:PrintToPlayer("NIL!");
        return
    end
    if (state == nil) then
        player:PrintToPlayer("NIL!");
        return
    end
    if (duration == nil) then
        duration = 65535;
    end

    if (state == "open") then
        GetNPCByID(npcID):openDoor(duration)
    elseif (state == "close") then
        GetNPCByID(npcID):closeDoor(duration)
    end
end;