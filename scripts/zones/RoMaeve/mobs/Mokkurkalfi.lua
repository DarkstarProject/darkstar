-----------------------------------
-- Area: RoMaeve
--   NM: Mokkurkalfi
-- Note: spawned during mission "The Final Image"
-----------------------------------
local ID = require("scripts/zones/RoMaeve/IDs")
require("scripts/globals/missions")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180)
end

function onMobSpawn(mob)
    DespawnMob(mob:getID(), 180)
end

function onMobDeath(mob, player, isKiller)
    if player:getCurrentMission(BASTOK) == THE_FINAL_IMAGE and player:getVar("MissionStatus") == 1 then
        player:setVar("Mission7-1MobKilled", 1)
    end
end