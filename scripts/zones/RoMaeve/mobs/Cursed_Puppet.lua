-----------------------------------
-- Area: RoMaeve
--  MOB: Cursed Puppet
-----------------------------------
require("scripts/globals/fieldsofvalor");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    checkRegime(player,mob,121,1);
end;
