-----------------------------------
-- Area: Temple Of Uggalepih
--  MOB: Iron Maiden
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,795,2);
end;