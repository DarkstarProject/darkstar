-----------------------------------
-- Area: West Saurtabaruta (S)
--  Mob: Toad
-- Note: Place holder Ramponneau
-----------------------------------
require("scripts/zones/West_Sarutabaruta_[S]/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,RAMPONNEAU_PH,20,5400); -- 90 minutes
end;
