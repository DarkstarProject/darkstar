-----------------------------------
-- Area: Stellar Fulcrum
-- Door: Qe'Lov Gate
-- @pos -520 -4 17 179
-------------------------------------
package.loaded["scripts/zones/Stellar_Fulcrum/TextIDs"] = nil;
package.loaded["scripts/globals/bcnm"] = nil;
-------------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/missions");
require("scripts/zones/Stellar_Fulcrum/TextIDs");

    -- events:
    -- 7D00 : BC menu
    -- Param 4 is a bitmask for the choice of battlefields in the menu:
    
    -- 1/0: Zilart Mission 8
    -- 2/1: 
    -- 3/2: 

-----------------------------------
-- onTrigger Action
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