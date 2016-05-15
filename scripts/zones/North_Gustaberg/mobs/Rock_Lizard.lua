-----------------------------------
-- Area: North Gustaberg
--  MOB: Rock Lizard
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,19,2);
end;
