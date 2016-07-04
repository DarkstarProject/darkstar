-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Antican Auxiliarius
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,110,1);
end;
