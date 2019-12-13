-----------------------------------
-- Area: Western Altepa Desert
--  Mob: Eastern Sphinx
-----------------------------------
local ID = require("scripts/zones/Western_Altepa_Desert/IDs")
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
    if
        GetMobByID(ID.mob.EASTERN_SPHINX):isDead() and
        GetMobByID(ID.mob.WESTERN_SPHINX):isDead() and
        player:getCurrentMission(BASTOK) == dsp.mission.id.bastok.RETURN_OF_THE_TALEKEEPER and
        player:getCharVar("MissionStatus") == 2
    then
        player:setCharVar("Mission6-1MobKilled", 1)
    end
end
