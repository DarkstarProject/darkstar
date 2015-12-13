-----------------------------------
-- Area: Den of Rancor
--  MOB: Demonic Pugil
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,801,1);
end;