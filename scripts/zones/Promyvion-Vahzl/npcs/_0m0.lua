-----------------------------------
-- Area: Promyvion vahzl
--  NPC: Memory flux (3)
-----------------------------------
package.loaded["scripts/zones/Promyvion-Vahzl/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/Promyvion-Vahzl/TextIDs");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus")==5) then
        SpawnMob(16867329):updateClaim(player);
    elseif (player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus")==6) then
        player:startEvent(53);
    else
        player:messageSpecial(OVERFLOWING_MEMORIES);
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    if (csid == 53) then
      player:setVar("PromathiaStatus",7);
    end
end;