-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Goblin Reaper
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,113,3);
end;
