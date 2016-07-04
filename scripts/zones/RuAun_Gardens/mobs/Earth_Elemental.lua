-----------------------------------
-- Area: RuAun Gardens
--  MOB: Earth Elemental
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,146,2);
end;
