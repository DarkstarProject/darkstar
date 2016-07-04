-----------------------------------
-- Area: Valley of Sorrows
--  MOB: Peryton
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,139,2);
    checkRegime(player,mob,141,1);
end;
