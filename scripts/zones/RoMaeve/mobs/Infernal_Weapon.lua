-----------------------------------
-- Area: RoMaeve
--  MOB: Infernal Weapon
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,123,1);
end;
