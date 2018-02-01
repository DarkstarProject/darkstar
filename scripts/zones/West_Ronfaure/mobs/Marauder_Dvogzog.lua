-----------------------------------
-- Area: West Ronfaure
--  MOB: Marauder Dvogzog
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/fieldsofvalor");
require("scripts/globals/missions");
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_IDLE_DESPAWN, 180);
end;

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(SANDORIA) == PRESTIGE_OF_THE_PAPSQUE and player:getVar("MissionStatus") == 1) then
        player:setVar("Mission7-1MobKilled",1);
        player:needToZone(true);
    end
    checkRegime(player,mob,4,1);
end;
