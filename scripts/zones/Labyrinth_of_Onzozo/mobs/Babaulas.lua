-----------------------------------
-- Area: The Labyrinth of Onzozo
--  MOB: Babaula
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,776,1);
end;