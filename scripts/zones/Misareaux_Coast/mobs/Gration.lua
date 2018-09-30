-----------------------------------
-- Area: Misareaux Coast
--  MOB: Gration
-----------------------------------
mixins = {require("scripts/mixins/fomor_hate")}
local ID = require("scripts/zones/Misareaux_Coast/IDs");
require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobSpawn(mob)
    mob:addStatusEffect(dsp.effect.KILLER_INSTINCT,40,0,0);
    mob:setLocalVar("fomorHateAdj", -2);
end;

function onMobFight(mob,target)
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(ID.mob.GRATION_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
