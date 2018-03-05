-----------------------------------
-- Area: Grand Palace of Hu'Xzoi
--  NPC: cermet portal
-- !pos 440 0 401 34
-----------------------------------
package.loaded["scripts/zones/Grand_Palace_of_HuXzoi/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Grand_Palace_of_HuXzoi/TextIDs");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == A_FATE_DECIDED  and player:getVar("PromathiaStatus")==1) then
       SpawnMob(16916813):updateClaim(player);
    elseif (player:getCurrentMission(COP) == A_FATE_DECIDED  and player:getVar("PromathiaStatus")==2) then
      player:startEvent(3);

    end
    return 1;
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 3) then
      player:setVar("PromathiaStatus",0);
           player:completeMission(COP,A_FATE_DECIDED);
        player:addMission(COP,WHEN_ANGELS_FALL);
    end
end;