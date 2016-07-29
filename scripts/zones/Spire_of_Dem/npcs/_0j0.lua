-----------------------------------
-- Area: Spire_of_Dem
-- NPC:  Web of Recollections
-- @pos 0.000 -2.0 247.992 19
-----------------------------------
package.loaded["scripts/zones/Spire_of_Dem/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Spire_of_Dem/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (TradeBCNM(player,player:getZoneID(),trade,npc)) then
        return;
    end
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (EventTriggerBCNM(player,npc)) then
        return 1;
    else
        player:messageSpecial(FAINT_SCRAPING);
        return 1;
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);

    if (EventUpdateBCNM(player,csid,option)) then
        return;
    end
    
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
    
    if (EventFinishBCNM(player,csid,option)) then
        return;
    end
    
end;