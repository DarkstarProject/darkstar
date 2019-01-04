-----------------------------------
-- Area: Sauromugue Champaign
--  MOB: Verthandi
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.VERTHANDI_ENSNARER);
end;