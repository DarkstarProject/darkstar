-----------------------------------
-- Area: RuAun Gardens
--  MOB: Fire Elemental
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,145,1);
end;
