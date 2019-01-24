-----------------------------------
-- Area: Promyvion vahzl
--   NM: Propagator
-----------------------------------
require("scripts/globals/missions")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus") == 1 then
        player:setVar("PromathiaStatus", 2)
    end
end