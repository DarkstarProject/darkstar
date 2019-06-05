-----------------------------------
-- Area: FeiYin
--   NM: Dabotz's Ghost
-----------------------------------
require("scripts/globals/keyitems")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if player:hasKeyItem(dsp.ki.AQUAFLORA3) then
        player:setVar("DabotzKilled", 1)
    end
end
