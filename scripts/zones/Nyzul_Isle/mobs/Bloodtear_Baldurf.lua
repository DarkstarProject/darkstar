-----------------------------------
-- Area: Nyzul Isle
--   NM: Bloodtear Baldurf
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.THE_HORNSPLITTER);
end;