-----------------------------------
-- Area: Grand Palace of Hu'Xzoi
--  NPC: cermet portal
-- !pos 420 0 401 34
-----------------------------------
local ID = require("scripts/zones/Grand_Palace_of_HuXzoi/IDs");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    local cop = player:getCurrentMission(COP);
    local copStat = player:getVar("PromathiaStatus");
    
    if (cop == A_FATE_DECIDED and copStat == 1 and not GetMobByID(ID.mob.IXGHRAH):isSpawned()) then
        SpawnMob(ID.mob.IXGHRAH):updateClaim(player);
    elseif (cop == A_FATE_DECIDED and copStat == 2) then
        player:startEvent(3);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 3) then
        player:setVar("PromathiaStatus", 0);
        player:completeMission(COP, A_FATE_DECIDED);
        player:addMission(COP, WHEN_ANGELS_FALL);
    end
end;
