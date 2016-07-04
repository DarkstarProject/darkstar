-----------------------------------
-- Area: Pashhow Marshlands
--  MOB: Goobbue
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,60,3);
end;
