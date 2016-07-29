-----------------------------------
--  Area: Grand Palace of Hu'Xzoi
--  NPC:  Particle Gate
--  @pos -483 0 259 34
-----------------------------------
package.loaded["scripts/zones/Grand_Palace_of_HuXzoi/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Grand_Palace_of_HuXzoi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x00ad);
    return 1;
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
end;