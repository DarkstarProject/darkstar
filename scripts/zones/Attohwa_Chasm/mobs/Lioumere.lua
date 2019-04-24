-----------------------------------
-- Area: Attohwa Chasm
--  MOB: Lioumere
-----------------------------------
mixins = {require("scripts/mixins/families/antlion_ambush")}
require("scripts/globals/keyitems");
require("scripts/globals/missions");

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(COP) == dsp.mission.id.cop.THE_ROAD_FORKS and player:getVar("MEMORIES_OF_A_MAIDEN_Status") >= 7 and not player:hasKeyItem(dsp.ki.MIMEO_JEWEL)) then
        player:setVar("MEMORIES_OF_A_MAIDEN_Status", 8);
        player:setVar("LioumereKilled",os.time());
    end
end;
