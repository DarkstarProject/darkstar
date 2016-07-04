-----------------------------------
--  Area: Grand Palace of Hu'Xzoi
--  NPC:  Particle Gate
--  @pos 1 0.1 -320 34
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
    if (player:getCurrentMission(COP) == A_FATE_DECIDED  and player:getVar("PromathiaStatus")==0) then
        player:startEvent(0x0002);
    else
        player:startEvent(0x0038);
    end
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
    if (csid == 0x0002) then
      player:setVar("PromathiaStatus",1);
    end
end;