-----------------------------------
-- Area: Promyvion vahzl
--   NM: Solicitor
-----------------------------------
require("scripts/globals/missions")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus") == 3 then
        player:setVar("PromathiaStatus", 4)
    end
end