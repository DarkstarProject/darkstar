-----------------------------------
-- Area: Promyvion vahzl
--  NPC: Memory flux (2)
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
    if (player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus")==3 and not GetMobByID(SOLICITOR):isSpawned()) then
        SpawnMob(SOLICITOR):updateClaim(player);
    elseif (player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus")==4) then
        player:startEvent(52);
    else
        player:messageSpecial(OVERFLOWING_MEMORIES);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 52) then
        player:setVar("PromathiaStatus",5);
    end
end;
