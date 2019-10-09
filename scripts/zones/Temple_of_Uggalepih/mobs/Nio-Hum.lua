-----------------------------------
-- Area: Temple of Uggalepih
--   NM: Nio-Hum
-----------------------------------
local ID = require("scripts/zones/Temple_of_Uggalepih/IDs")
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/missions")
require("scripts/globals/status")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 180)
end

function onMobSpawn(mob)
    DespawnMob(mob:getID(), 180)
    mob:addMod(dsp.mod.SLEEPRES, 50)
    mob:addMod(dsp.mod.LULLABYRES, 50)
    mob:addMod(dsp.mod.STUNRES, 50)
    mob:addMod(dsp.mod.DMGMAGIC, 80)
end

function onMobDeath(mob, player, isKiller)
    if
        player:getCurrentMission(SANDORIA) == dsp.mission.id.sandoria.LIGHTBRINGER and
        player:getCharVar("MissionStatus") == 5 and
        GetMobByID(ID.mob.NIO_A):isDead()
    then
        player:setCharVar("Mission8-2Kills", 1)
    end
end
