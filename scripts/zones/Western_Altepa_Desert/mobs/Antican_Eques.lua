-----------------------------------
-- Area: Western Altepa Desert
--  MOB: Antican Eques
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,135,2);
end;
