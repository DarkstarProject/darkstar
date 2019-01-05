-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Sabotender Enamorado
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180)
end

function onMobDeath(mob, player, isKiller)
    if player:getCurrentMission(SANDORIA) == LEAUTE_S_LAST_WISHES and player:getVar("MissionStatus") == 2 then
        player:setVar("Mission6-1MobKilled", 1)
    end
end
