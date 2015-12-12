-----------------------------------
-- Area: Den of Rancor
--  MOB: Doom Toad
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,801,2);
end;