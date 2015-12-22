-----------------------------------
--    Area: Southern San d'Oria
--    NPC: The Picture ??? in Vemalpeau's house
-- Involved in Quests: Under Oath
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)    
    if (player:getVar("UnderOathCS") == 4) then  -- Quest: Under Oath - PLD AF3
        player:startEvent(0x029)
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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
        
    if (csid == 0x029 and option == 1) then
        player:addKeyItem(STRANGE_SHEET_OF_PAPER);
        player:messageSpecial(KEYITEM_OBTAINED,STRANGE_SHEET_OF_PAPER);
    end
end;
