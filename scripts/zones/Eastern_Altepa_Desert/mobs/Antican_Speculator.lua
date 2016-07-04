-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Antican Speculator
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,112,3);
end;
