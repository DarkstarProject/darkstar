-----------------------------------
-- Area: Gustav Tunnel
--  MOB: Doom Mage
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,765,2);
end;