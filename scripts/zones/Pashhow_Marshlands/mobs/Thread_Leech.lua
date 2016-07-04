-----------------------------------
-- Area: Pashhow Marshlands
--  MOB: Thread Leech
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,22,1);
    checkRegime(player,mob,23,2);
end;
