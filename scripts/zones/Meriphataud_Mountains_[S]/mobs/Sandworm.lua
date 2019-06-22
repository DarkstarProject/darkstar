-----------------------------------
-- Area: Crystal War Areas
--  MOB: Sandworm
-- Note: Title Given if Sandworm does not Doomvoid
-----------------------------------
require("scripts/globals/titles")
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.SANDWORM_WRANGLER)
end