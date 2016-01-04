-----------------------------------
-- Area: Fei'Yin
--  MOB: Hellish Weapon
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,716,2);
end;