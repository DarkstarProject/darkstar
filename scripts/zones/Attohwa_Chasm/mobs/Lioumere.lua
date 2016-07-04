-----------------------------------
-- Area: Attohwa Chasm
--  MOB: Lioumere
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/status");
mixins = {require("scripts/mixins/families/antlion_ambush")}

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(COP) == THE_ROAD_FORKS and player:getVar("MEMORIES_OF_A_MAIDEN_Status")>=7 and  player:hasKeyItem(MIMEO_JEWEL)==false) then
        player:setVar("MEMORIES_OF_A_MAIDEN_Status",8);
        player:setVar("LioumereKilled",os.time());
    end
end;