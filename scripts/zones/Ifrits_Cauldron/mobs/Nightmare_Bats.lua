-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Nightmare Bats
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,760,1);
end;