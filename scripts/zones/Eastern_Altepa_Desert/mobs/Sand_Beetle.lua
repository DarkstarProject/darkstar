-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Sand Beetle
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,110,3);
end;
