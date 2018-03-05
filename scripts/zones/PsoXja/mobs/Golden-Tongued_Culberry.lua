-----------------------------------
-- Area: Pso'xja
--  MOB: Golden-Tongued Culberry
-----------------------------------
mixins = {require("scripts/mixins/families/tonberry")}
require("scripts/zones/PsoXja/MobIDs");
require("scripts/globals/settings");

function onMobFight(mob,target)
    mob:SetAutoAttackEnabled(false);
    mob:SetMobAbilityEnabled(false);
    mob:setMobMod(MOBMOD_MAGIC_COOL, 6);
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(GOLDEN_TONGUED_CULBERRY_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
