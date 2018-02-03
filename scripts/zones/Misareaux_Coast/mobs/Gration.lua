-----------------------------------
-- Area: Misareaux Coast
--  MOB: Gration
-----------------------------------
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
    GetNPCByID(16879918):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;