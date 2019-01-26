-----------------------------------
-- Area: Nyzul Isle
--  NM:  Steelfleece_Baldarich
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.THE_HORNSPLITTER);
end;