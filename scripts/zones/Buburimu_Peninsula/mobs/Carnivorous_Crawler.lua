-----------------------------------
-- Area: Buburimu Peninsula
--  MOB: Carnivorous Crawler
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,33,1);
    checkRegime(player,mob,34,2);
end;
