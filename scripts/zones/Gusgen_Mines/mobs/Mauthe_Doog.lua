-----------------------------------
-- Area: Gusgen Mines
--  MOB: Mauthe Doog
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,682,3);
end;