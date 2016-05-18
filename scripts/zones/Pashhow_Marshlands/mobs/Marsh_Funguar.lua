-----------------------------------
-- Area: Pashhow Marshlands
--  MOB: Marsh Funguar
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,24,1);
    checkRegime(player,mob,60,2);
end;
