-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Vault Weapon
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkGoVregime(player,mob,705,1);
    checkGoVregime(player,mob,708,2);
end;