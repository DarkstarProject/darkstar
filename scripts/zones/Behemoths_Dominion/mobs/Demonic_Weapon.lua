-----------------------------------
-- Area: Behemoths Dominion
--  MOB: Demonic Weapon
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer,ally)
    checkRegime(ally,mob,102,2);
end;
