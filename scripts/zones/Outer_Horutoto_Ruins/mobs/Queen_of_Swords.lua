-----------------------------------
-- Area: Outer Horutoto Ruins
--   NM: Queen of Swords
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/missions")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if player:getCurrentMission(WINDURST) == dsp.mission.id.windurst.THE_JESTER_WHO_D_BE_KING and player:getVar("MissionStatus") == 4 and GetMobByID(mob:getID() + 1):isDead() then
        player:setVar("MissionStatus", 5)
    end
end