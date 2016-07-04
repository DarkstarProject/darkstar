-----------------------------------
-- Area: Pashhow Marshlands
--  MOB: Jolly Green
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,60,3);
end;
