-----------------------------------
-- Area: The Labyrinth of Onzozo
--  MOB: Mushussu
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,773,1);
end;