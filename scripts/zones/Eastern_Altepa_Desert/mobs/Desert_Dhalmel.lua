-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Desert Dhalmel
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,111,3);
end;
