-----------------------------------
-- Area: Promyvion - Vahzl
--   NM: Ponderer
-----------------------------------
require("scripts/globals/missions")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if player:getCurrentMission(COP) == dsp.mission.id.cop.DESIRES_OF_EMPTINESS and player:getCharVar("PromathiaStatus") == 5 then
        player:setCharVar("PromathiaStatus", 6)
    end
end