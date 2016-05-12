-----------------------------------
-- Area: West Sarutabaruta
--  MOB: Savanna Rarab
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,27,1);
end;
