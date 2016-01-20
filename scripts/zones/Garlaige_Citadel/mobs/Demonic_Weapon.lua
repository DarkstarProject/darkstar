-----------------------------------
-- Area: Garlaige Citadel
--  MOB: Demonic Weapon
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,705,1);
end;