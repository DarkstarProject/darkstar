-----------------------------------
-- Area: The Sanctuary of ZiTah
--  MOB: Master Coeurl
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,117,1);
    checkRegime(ally,mob,118,2);
end;
