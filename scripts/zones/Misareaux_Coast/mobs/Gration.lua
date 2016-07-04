-----------------------------------
-- Area: Misareaux Coast
--  MOB: Gration
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- OnMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:addStatusEffect(EFFECT_KILLER_INSTINCT,40,0,0);
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local kills = player:getVar("FOMOR_HATE");
    if (kills > 1) then
        player:setVar("FOMOR_HATE",kills -2);
    end
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    GetNPCByID(16879918):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;