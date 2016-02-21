-----------------------------------
--    Area: Windurst Waters
--    NPC:  Alter Of Offering
--    Involved in Quest: A Crisis in the Making
--    Working 100%
--  @zone = 145
--  @pos = -137 17 177
-----------------------------------
package.loaded["scripts/zones/Giddeus/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");    
require("scripts/zones/Giddeus/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;      

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    crisisstatus = player:getQuestStatus(WINDURST,A_CRISIS_IN_THE_MAKING);
    if (crisisstatus >= 1 and player:getVar("QuestCrisisMaking_var") == 1) then    
        player:startEvent(0x0035); -- A Crisis in the Making: Receive Offering
    else
        player:startEvent(0x003c); -- Standard Message
    end    
end; 

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------
    
function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    if (csid == 0x0035 and option == 1) then
        player:addKeyItem(39,OFF_OFFERING);
        player:messageSpecial(KEYITEM_OBTAINED,OFF_OFFERING);    
        player:setVar("QuestCrisisMaking_var",2);
    end
end;
