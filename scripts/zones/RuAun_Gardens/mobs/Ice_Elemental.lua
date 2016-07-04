-----------------------------------
-- Area: RuAun Gardens
--  MOB: Ice Elemental
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,146,1);
end;
