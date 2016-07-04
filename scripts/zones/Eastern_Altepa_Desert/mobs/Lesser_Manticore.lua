-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Lesser Manticore
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,112,4);
    checkRegime(player,mob,113,4);
end;
