-----------------------------------
-- Area: Nyzul Isle
--  NM:  Steelfleece_Baldarich
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.titles.THE_HORNSPLITTER);
end;