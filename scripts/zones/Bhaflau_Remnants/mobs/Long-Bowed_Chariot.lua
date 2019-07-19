-----------------------------------
-- Area: Bhaflau Remnants
--  Mob: Long-Bowed Chariot
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.COMET_CHARIOTEER);
end;