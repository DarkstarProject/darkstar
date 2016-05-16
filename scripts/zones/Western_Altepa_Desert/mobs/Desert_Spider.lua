-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Desert Spider
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,134,1);
end;
