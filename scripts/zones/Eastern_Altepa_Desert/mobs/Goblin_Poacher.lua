-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Goblin Poacher
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,113,1);
end;
