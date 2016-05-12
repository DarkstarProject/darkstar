-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Desert Beetle
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,136,1);
end;
