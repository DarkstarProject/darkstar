-----------------------------------
-- Area: Pashhow Marshlands
--  MOB: Carnivorous Crawler
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,23,1);
    checkRegime(player,mob,24,2);
end;
