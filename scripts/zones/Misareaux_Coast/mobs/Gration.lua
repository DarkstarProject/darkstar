-----------------------------------
-- Area: Misareaux Coast
--  MOB: Gration
-----------------------------------
require("scripts/zones/Misareaux_Coast/MobIDs");
require("scripts/globals/settings");
require("scripts/globals/status");
-----------------------------------

function onMobInitialize(mob)
end;

function onMobSpawn(mob)
    mob:addStatusEffect(EFFECT_KILLER_INSTINCT,40,0,0);
end;

function onMobFight(mob,target)
end;

function onMobDeath(mob, player, isKiller)
    local kills = player:getVar("FOMOR_HATE");
    if (kills > 1) then
        player:setVar("FOMOR_HATE",kills -2);
    end
end;

function onMobDespawn(mob)
    GetNPCByID(GRATION_QM):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
