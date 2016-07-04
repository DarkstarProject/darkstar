-----------------------------------
--  Area: Grand Palace of Hu'Xzoi
--  NPC:  cermet portal
--  @pos 440 0 401 34
-----------------------------------
package.loaded["scripts/zones/Grand_Palace_of_HuXzoi/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Grand_Palace_of_HuXzoi/TextIDs");
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == A_FATE_DECIDED  and player:getVar("PromathiaStatus")==1) then
       SpawnMob(16916813,180):updateClaim(player);
    elseif (player:getCurrentMission(COP) == A_FATE_DECIDED  and player:getVar("PromathiaStatus")==2) then
      player:startEvent(0x0003);

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
    if (csid == 0x0003) then
      player:setVar("PromathiaStatus",0);
           player:completeMission(COP,A_FATE_DECIDED);
        player:addMission(COP,WHEN_ANGELS_FALL);
    end
end;