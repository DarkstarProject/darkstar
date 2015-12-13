-----------------------------------
-- Area: RoMaeve
--  MOB: Ominous Weapon
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,119,2);
end;
