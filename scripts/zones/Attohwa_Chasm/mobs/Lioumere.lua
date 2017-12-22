-----------------------------------
-- Area: Attohwa Chasm
--  MOB: Lioumere
-----------------------------------
mixins = {require("scripts/mixins/families/antlion_ambush")}
require("scripts/globals/keyitems");
require("scripts/globals/missions");

function onMobSpawn(mob)
end;

function onMobEngaged(mob, target)
end;

function onMobDisengage(mob)
end;

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(COP) == THE_ROAD_FORKS and player:getVar("MEMORIES_OF_A_MAIDEN_Status") >= 7 and not player:hasKeyItem(MIMEO_JEWEL)) then
        player:setVar("MEMORIES_OF_A_MAIDEN_Status", 8);
        player:setVar("LioumereKilled",os.time());
    end
end;
