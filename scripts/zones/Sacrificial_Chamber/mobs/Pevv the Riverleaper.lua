-----------------------------------
-- Area: Sacrificial Chamber
--  MOB: Pevv the Riverleaper
-- BCNM: Amphibian Assault
-----------------------------------
require("scripts/globals/status");
-----------------------------------

function onMobFight(mob,target)
    -- spawn pet wyvern and assign it a target
    local mobId = mob:getID();
    local pet = GetMobByID(mobId + 2);
    if (not pet:isSpawned()) then
        SpawnMob(mobId + 2):updateEnmity(target);
    elseif (pet:getCurrentAction() == ACTION_ROAMING) then
        pet:updateEnmity(target);
    end
end;

function onMobDeath(mob, player, isKiller)
    -- despawn pet wyvern
    DespawnMob(mob:getID() + 2);
end;
