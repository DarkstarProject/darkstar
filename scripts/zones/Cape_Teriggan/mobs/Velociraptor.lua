-----------------------------------
-- Area: Cape Teriggan
--  MOB: Velociraptor
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,106,2);
    checkRegime(player,mob,107,1);
end;
