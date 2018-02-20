-----------------------------------
-- Area: Pso'xja
--  MOB: Golden-Tongued Culberry
-----------------------------------

function onMobFight(mob,target)
    mob:SetAutoAttackEnabled(false);
    mob:SetMobAbilityEnabled(false);
    mob:setMobMod(MOBMOD_MAGIC_COOL, 6);
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(16814434):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;