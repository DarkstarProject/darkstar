-----------------------------------
-- Area: Pashhow Marshlands
--  MOB: Old Quadav
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,60,1);
end;
