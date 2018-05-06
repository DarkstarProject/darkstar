-----------------------------------
-- Area: Promyvion vahzl
--  NPC: Memory flux (3)
-----------------------------------
package.loaded["scripts/zones/Promyvion-Vahzl/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Promyvion-Vahzl/TextIDs");
require("scripts/zones/Promyvion-Vahzl/MobIDs");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus")==5 and not GetMobByID(PONDERER):isSpawned()) then
        SpawnMob(PONDERER):updateClaim(player);
    elseif (player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus")==6) then
        player:startEvent(53);
    else
        player:messageSpecial(OVERFLOWING_MEMORIES);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 53) then
        player:setVar("PromathiaStatus",7);
    end
end;
