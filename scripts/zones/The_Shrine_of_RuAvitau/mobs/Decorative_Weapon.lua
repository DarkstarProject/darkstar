-----------------------------------
-- Area: Shrine of Ru'Avitau
--  MOB: Decorative Weapon
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,749,1);
    checkGoVregime(ally,mob,753,1);
end;