-----------------------------------
-- Area: RuAun Gardens
--  MOB: Air Elemental
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,145,2);
end;
