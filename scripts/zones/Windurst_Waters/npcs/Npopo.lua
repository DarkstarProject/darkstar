-----------------------------------
--  Area: Windurst Waters
--  NPC:  Npopo
--  Type: Standard NPC
--  @pos -35.464 -5.999 239.120 238
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Windurst_Waters/TextIDs");

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

    if (player:getQuestStatus(WINDURST,LURE_OF_THE_WILDCAT_WINDURST) == QUEST_ACCEPTED and player:getMaskBit(WildcatWindurst,10) == false) then
        player:startEvent(0x03a8);
    else
        player:startEvent(0x010d);
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
    
    if (csid == 0x03a8) then
        player:setMaskBit(player:getVar("WildcatWindurst"),"WildcatWindurst",10,true);
    end    
    
end;

