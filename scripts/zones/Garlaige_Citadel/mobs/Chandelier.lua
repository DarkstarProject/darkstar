-----------------------------------
-- Area: Garlaige Citadel
--   NM: Chandelier
-- Note: Spawned for quest "Hitting the Marquisate"
-----------------------------------
require("scripts/zones/Garlaige_Citadel/MobIDs");
require("scripts/globals/status");
-----------------------------------

function onMobEngaged(mob, target)
    local ce = mob:getCE(target);
    local ve = mob:getVE(target);
    if (ce==0 and ve==0) then
        mob:setMobMod(dsp.mobMod.NO_DROPS, 1);
        mob:useMobAbility(511); -- self-destruct
    end
end;

function onMobDeath(mob, player, isKiller)
    GetNPCByID(CHANDELIER_QM):setLocalVar("pop", os.time() + 600); -- 10 minutes until Chandelier can be popped again
end;
