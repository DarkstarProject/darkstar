-----------------------------------
-- Area: North Gustaberg
--  MOB: Amethyst Quadav
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,19,1);
    checkRegime(player,mob,59,1);
end;
