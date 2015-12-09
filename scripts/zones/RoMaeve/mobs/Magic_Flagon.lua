-----------------------------------
-- Area: RoMaeve
--  MOB: Magic Flagon
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,120,1);
end;
