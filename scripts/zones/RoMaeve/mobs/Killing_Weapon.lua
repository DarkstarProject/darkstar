-----------------------------------
-- Area: RoMaeve
--  MOB: Killing Weapon
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,119,1);
end;
