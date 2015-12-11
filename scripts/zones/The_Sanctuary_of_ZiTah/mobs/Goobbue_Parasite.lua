-----------------------------------
-- Area: The Sanctuary of ZiTah
--  MOB: Goobbue Parasite
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,116,1);
    checkRegime(ally,mob,117,2);
end;
