-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Tulwar Scorpion
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,137,2);
end;
