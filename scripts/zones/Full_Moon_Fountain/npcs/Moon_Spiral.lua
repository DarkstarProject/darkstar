-----------------------------------
-- Area: Full Moon Fountain
-- NPC:  Moon Spiral
-- Involved in Quests: The Moonlit Path
-- @pos -302 9 -260 170
-----------------------------------
package.loaded["scripts/zones/Full_Moon_Fountain/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/bcnm");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/zones/Full_Moon_Fountain/TextIDs");

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
printf("onUpdate CSID: %u",csid);
printf("onUpdate RESULT: %u",option);

    if (EventUpdateBCNM(player,csid,option)) then
        return;
    end
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
printf("onFinish CSID: %u",csid);
printf("onFinish RESULT: %u",option);

    if (EventFinishBCNM(player,csid,option)) then
        return;
    end
end;