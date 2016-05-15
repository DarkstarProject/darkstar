-----------------------------------
-- Area: Buburimu Peninsula
--  MOB: Mighty Rarab
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,32,2);
end;
