-----------------------------------
-- Area: Valley of Sorrows
--  MOB: Velociraptor
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,139,1);
    checkRegime(player,mob,140,1);
end;
