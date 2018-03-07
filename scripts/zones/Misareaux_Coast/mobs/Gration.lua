-----------------------------------
-- Area: Misareaux Coast
--  MOB: Gration
-----------------------------------
mixins = {require("scripts/mixins/fomor_hate")}
require("scripts/zones/Misareaux_Coast/MobIDs");
require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobSpawn(mob)
    mob:addStatusEffect(EFFECT_KILLER_INSTINCT,40,0,0);
    mob:setLocalVar("fomorHateAdj", -2);
end;

function onMobFight(mob,target)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(GRATION_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
