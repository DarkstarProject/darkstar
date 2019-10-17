-----------------------------------
-- Area: Kuftal Tunnel
--   NM: Gordov's Ghost
-----------------------------------
require("scripts/globals/missions")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180)
end

function onMobDeath(mob, player, isKiller)
    if player:getCurrentMission(BASTOK) == dsp.mission.id.bastok.ENTER_THE_TALEKEEPER and player:getCharVar("MissionStatus") == 2 then
        player:setCharVar("MissionStatus", 3)
    end
end
