-----------------------------------
-- Area: The Labyrinth of Onzozo
--  MOB: Boribaba
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,776,2);
end;