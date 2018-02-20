-----------------------------------
-- Area: Quicksand Caves
--  NPC: Ornate Door
-- Door blocked by Weight system
-- !pos -420 0 735 208
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Quicksand_Caves/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local difX = player:getXPos()-(-420);
    local difZ = player:getZPos()-(726);
    local Distance = math.sqrt( math.pow(difX,2) + math.pow(difZ,2) );
    if (Distance < 3) then
        return -1;
    end

    player:messageSpecial(DOOR_FIRMLY_SHUT);
    return 1;
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;