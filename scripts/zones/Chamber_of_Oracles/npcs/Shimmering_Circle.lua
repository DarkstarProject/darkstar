-----------------------------------
-- Area: Chamber of Oracles
-- NPC:  Shimmering Circle
-- @pos -220 0 12 168
-------------------------------------
package.loaded["scripts/zones/Chamber_of_Oracles/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/missions");
require("scripts/zones/Chamber_of_Oracles/TextIDs");

-------------------------------------
    
    --- 1/0: Through the Quicksand Caves
    --- 2/1: Legion XI Comitatensis
    --- 4/2: Shattering Stars (Samurai)
    --- 8/3: Shattering Stars (Ninja)
    --- 16/4: Shattering Stars (Dragoon)
    --- Cactuar Suave
    --- Eye of the Storm
    --- The Scarlet King
    --- Roar! A Cat Burglar Bares Her Fangs

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