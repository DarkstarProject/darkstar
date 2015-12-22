-----------------------------------
--  Area: Windurst Walls
--  NPC:  Chomomo
--  Type: Standard NPC
--  @pos -1.262 -11 290.224 239
-----------------------------------
package.loaded["scripts/zones/Windurst_Walls/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Windurst_Walls/TextIDs");

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

    if (player:getQuestStatus(WINDURST,LURE_OF_THE_WILDCAT_WINDURST) == QUEST_ACCEPTED and player:getMaskBit(WildcatWindurst,8) == false) then
        player:startEvent(0x01f3);
    else
        player:startEvent(0x0145);
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

    if (csid == 0x01f3) then
        player:setMaskBit(player:getVar("WildcatWindurst"),"WildcatWindurst",8,true);
    end    

end;

