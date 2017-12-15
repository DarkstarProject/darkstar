-----------------------------------
-- Area: Zeruhn Mines (172)
--   Mob: Veindigger Leech
-----------------------------------
require("scripts/globals/groundsofvalor");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,630,2);
end;
