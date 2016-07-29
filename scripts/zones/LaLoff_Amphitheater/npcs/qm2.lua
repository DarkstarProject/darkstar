-----------------------------------
-- Area: LaLoff_Amphitheater
-- NPC:  Shimmering Circle (BCNM Exits)
-------------------------------------
package.loaded["scripts/zones/LaLoff_Amphitheater/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/LaLoff_Amphitheater/TextIDs");

    ---- 0: 
    ---- 1: 
    ---- 2: 
    ---- 3: 
    ---- 4: 
    ---- 5: 
    ---- 6: 
    ---- 7: 
    ---- 8: 
    ---- 9: 


-- Death cutscenes:

--    player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,0,0); -- hume
--    player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,1,0); -- taru
--    player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,2,0); -- mithra
--    player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,3,0); -- elvaan
--    player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,4,0); -- galka
--    player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,5,0); -- divine might
--    player:startEvent(0x7d01,1,1,1,instance:getTimeInside(),1,6,0); -- skip ending cs

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
        return;
    end
    
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("onUpdate CSID: %u",csid);
-- printf("onUpdate RESULT: %u",option);

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