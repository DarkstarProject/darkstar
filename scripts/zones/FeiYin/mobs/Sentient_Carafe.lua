-----------------------------------
-- Area: Fei'Yin
--  MOB: Sentient Carafe
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,718,2);
end;