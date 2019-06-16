-----------------------------------
-- Area: King Ranperres Tomb
--  MOB: Corrupted Yorgos
-----------------------------------
local ID = require("scripts/zones/King_Ranperres_Tomb/IDs")
require("scripts/globals/missions")

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180)
end

function onMobSpawn(mob)
    DespawnMob(mob:getID(), 180)
    mob:addMod(dsp.mod.SLEEPRES, 50)
    mob:addMod(dsp.mod.LULLABYRES, 50)
end

function onMobDeath(mob, player, isKiller)
    if (GetMobByID(ID.mob.CORRUPTED_YORGOS):isDead() and GetMobByID(ID.mob.CORRUPTED_SOFFEIL):isDead() and GetMobByID(ID.mob.CORRUPTED_ULBRIG):isDead()
        and player:getCurrentMission(SANDORIA) == dsp.mission.id.sandoria.RANPERRE_S_FINAL_REST and player:getVar("MissionStatus") == 1) then
        player:setVar("Mission6-2MobKilled", 1)
    end
end
