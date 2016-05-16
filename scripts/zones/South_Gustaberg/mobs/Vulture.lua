-----------------------------------
-- Area: South Gustaberg
--  MOB: Vulture
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,78,1);
end;
