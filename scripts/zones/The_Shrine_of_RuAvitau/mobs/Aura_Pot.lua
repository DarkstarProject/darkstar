-----------------------------------
-- Area: Shrine of Ru'Avitau
--  MOB: Aura Pot
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,749,1);
    checkGoVregime(ally,mob,751,1);
end;