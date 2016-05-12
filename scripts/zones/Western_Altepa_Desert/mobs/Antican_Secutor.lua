-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Antican Secutor
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,138,1);
end;
