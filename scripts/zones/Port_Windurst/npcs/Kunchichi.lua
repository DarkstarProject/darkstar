-----------------------------------
--  Area: Port Windurst
--  NPC:  Kunchichi
--  Type: Standard NPC
--  @pos -115.933 -4.25 109.533 240
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local WildcatWindurst = player:getVar("WildcatWindurst");

    if (player:getQuestStatus(WINDURST,LURE_OF_THE_WILDCAT_WINDURST) == QUEST_ACCEPTED and player:getMaskBit(WildcatWindurst,15) == false) then
        player:startEvent(0x026f);
    else
        player:startEvent(0x00e4);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    
    if (csid == 0x026f) then
        player:setMaskBit(player:getVar("WildcatWindurst"),"WildcatWindurst",15,true);
    end    
    
end;

