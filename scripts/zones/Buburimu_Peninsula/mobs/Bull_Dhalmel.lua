-----------------------------------
-- Area: Buburimu Peninsula
--  MOB: Bull Dhalmel
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,34,1);
    checkRegime(player,mob,35,2);
end;
