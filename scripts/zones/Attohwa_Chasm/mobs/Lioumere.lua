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

function onMobDeath(mob, killer, ally)
    if (ally:getCurrentMission(COP) == THE_ROAD_FORKS and ally:getVar("MEMORIES_OF_A_MAIDEN_Status")>=7 and  ally:hasKeyItem(MIMEO_JEWEL)==false) then
        ally:setVar("MEMORIES_OF_A_MAIDEN_Status",8);
        ally:setVar("LioumereKilled",os.time());
    end
end;