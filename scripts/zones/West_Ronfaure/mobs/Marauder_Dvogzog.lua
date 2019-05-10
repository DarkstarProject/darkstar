-----------------------------------
-- Area: West Ronfaure
--  MOB: Marauder Dvogzog
-----------------------------------
mixins = {require("scripts/mixins/job_special")};
require("scripts/globals/regimes")
require("scripts/globals/missions");
require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180);
end;

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(SANDORIA) == dsp.mission.id.sandoria.PRESTIGE_OF_THE_PAPSQUE and player:getVar("MissionStatus") == 1) then
        player:setVar("Mission7-1MobKilled",1);
        player:needToZone(true);
    end
    dsp.regime.checkRegime(player, mob, 4, 1, dsp.regime.type.FIELDS)
end;
