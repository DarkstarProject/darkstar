-----------------------------------
-- Area: Waughroon Shrine
-- MOB: Time Bomb
-- BCNM Fight: 3,2,1...
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged (mob,target)
    mob:setLocalVar("selfDestruct", os.time() + 60);
    mob:SetAutoAttackEnabled(false);
    mob:SetMobAbilityEnabled(false);
end;

function onMobFight (mob,target)
    if (os.time() > mob:getLocalVar("selfDestruct")) then
        mob:useMobAbility(256); -- self-destruct_321
    end;
end;

function onMobDeath(mob, player, isKiller)
end;
