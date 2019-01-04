-----------------------------------
-- Area:
--  MOB: Oupire
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.OUPIRE_IMPALER);
end;