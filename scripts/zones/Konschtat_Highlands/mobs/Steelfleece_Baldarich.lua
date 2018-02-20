-----------------------------------
-- Area: Konschtat Highlands
--  NM:  Steelfleece_Baldarich
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(THE_HORNSPLITTER);
end;