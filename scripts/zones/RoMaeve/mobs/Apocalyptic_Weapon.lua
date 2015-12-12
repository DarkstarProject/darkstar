-----------------------------------
-- Area: RoMaeve
--  MOB: Apocalyptic Weapon
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,122,1);
end;
