-----------------------------------
-- Area: Pso'Xja
--  NPC: Stone Gate
-----------------------------------
package.loaded["scripts/zones/PsoXja/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/PsoXja/TextIDs");
require("scripts/zones/PsoXja/MobIDs");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getCurrentMission(COP) == THE_ENDURING_TUMULT_OF_WAR and player:getVar("PromathiaStatus")==3 and not GetMobByID(NUNYUNUWI):isSpawned()) then
        SpawnMob(NUNYUNUWI):updateClaim(player);
    elseif ( (player:getCurrentMission(COP) == THE_ENDURING_TUMULT_OF_WAR and player:getVar("PromathiaStatus")==4) or player:hasCompletedMission(COP,THE_ENDURING_TUMULT_OF_WAR) or player:hasCompletedMission(COP,THE_LAST_VERSE)) then
        if (player:getZPos() < 318) then
            player:startEvent(69);
        else
            player:startEvent(70);
        end
    else
        player:messageSpecial(DOOR_LOCKED);
    end
    return 1;
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
