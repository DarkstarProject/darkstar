-----------------------------------
-- Area: Nyzul Isle
--   NM: Steelfleece Baldarich
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(tpz.title.THE_HORNSPLITTER);
end;