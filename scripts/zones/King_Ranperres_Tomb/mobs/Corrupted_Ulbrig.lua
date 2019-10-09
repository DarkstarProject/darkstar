-----------------------------------
-- Area: King Ranperres Tomb
--   NM: Corrupted Ulbrig
-----------------------------------
local ID = require("scripts/zones/King_Ranperres_Tomb/IDs")
require("scripts/globals/missions")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180)
    mob:setMod(dsp.mod.SLEEPRES, 50)
    mob:setMod(dsp.mod.LULLABYRES, 50)
end

function onMobSpawn(mob)
    DespawnMob(mob:getID(), 180)
end

function onMobDeath(mob, player, isKiller)
    if
        GetMobByID(ID.mob.CORRUPTED_YORGOS):isDead() and
        GetMobByID(ID.mob.CORRUPTED_SOFFEIL):isDead() and
        player:getCurrentMission(SANDORIA) == dsp.mission.id.sandoria.RANPERRE_S_FINAL_REST and
        player:getCharVar("MissionStatus") == 1
    then
        player:setCharVar("Mission6-2MobKilled", 1)
    end
end
