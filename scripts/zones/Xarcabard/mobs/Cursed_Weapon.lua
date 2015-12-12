-----------------------------------
-- Area: Xarcabard
--  MOB: Cursed Weapon
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,52,2);
    checkRegime(ally,mob,53,3);
end;
