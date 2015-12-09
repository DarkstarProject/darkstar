-----------------------------------
-- Area: The Sanctuary of ZiTah
--  MOB: Ogrefly
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,114,1);
    checkRegime(ally,mob,115,2);
end;
