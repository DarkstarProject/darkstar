-----------------------------------
-- Area: Bostaunieux Oubliette
--  MOB: Blind Bat
-----------------------------------

require("scripts/globals/groundsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkGoVregime(ally,mob,615,1);
    checkGoVregime(ally,mob,617,2);
end;
