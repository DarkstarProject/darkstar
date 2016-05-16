-----------------------------------
-- Area: North Gustaberg
--  MOB: Vulture
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,18,1);
end;
