-----------------------------------
-- Area: Eastern Altepa Desert
--  MOB: Antican Decurio
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,112,1);
end;
