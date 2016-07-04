-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Antican Faber
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,110,2);
    checkRegime(player,mob,111,2);
end;
