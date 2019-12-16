-----------------------------------
-- Area: Promyvion - Vahzl
--   NM: Solicitor
-----------------------------------
require("scripts/globals/missions")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if player:getCurrentMission(COP) == dsp.mission.id.cop.DESIRES_OF_EMPTINESS and player:getCharVar("PromathiaStatus") == 3 then
        player:setCharVar("PromathiaStatus", 4)
    end
end