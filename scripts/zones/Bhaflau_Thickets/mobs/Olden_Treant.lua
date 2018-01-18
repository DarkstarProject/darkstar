-----------------------------------
-- Area: Bhaflau Thickets
--  MOB: Olden Treant
-- Note: Place holder Emergent Elm
-----------------------------------
require("scripts/zones/Bhaflau_Thickets/MobIDs");
require("scripts/globals/mobs");

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    phOnDespawn(mob,EMERGENT_ELM_PH,5,14400); -- 4 hours
end;
