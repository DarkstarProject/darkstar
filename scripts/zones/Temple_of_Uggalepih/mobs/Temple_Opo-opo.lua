-----------------------------------
-- Area: Temple Of Uggalepih
--  MOB: Temple Opo-opo
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,792,2);
end;