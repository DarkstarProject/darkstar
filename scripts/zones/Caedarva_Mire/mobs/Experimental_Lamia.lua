-----------------------------------
-- Area: Caedarva Mire (79)
--   NM: Experimental Lamia (Tier III ZNM)
-- !pos -773.369 -11.824 322.298 79
-----------------------------------
local ID = require("scripts/zones/Caedarva_Mire/IDs")
require("scripts/globals/status")
-----------------------------------

local function spawnMinions(mob, target)
    mob:setLocalVar("spawnedMinions", 1)

    local x = mob:getXPos()
    local y = mob:getYPos()
    local z = mob:getZPos()

    for i = ID.mob.EXPERIMENTAL_LAMIA + 1, ID.mob.EXPERIMENTAL_LAMIA + 3 do
        local minion = GetMobByID(i)
        minion:setSpawn(x + math.random(-2, 2), y, z + math.random(-2, 2))
        minion:spawn()
        minion:updateEnmity(target)
    end
end

function onMobFight(mob, target)
    if mob:getHPP() < 75 and mob:getLocalVar("spawnedMinions") == 0 then
        spawnMinions(mob, target)
    end
    
    -- make sure minions have a target
    for i = ID.mob.EXPERIMENTAL_LAMIA + 1, ID.mob.EXPERIMENTAL_LAMIA + 3 do
        local minion = GetMobByID(i)
        if minion:getCurrentAction() == dsp.act.ROAMING then
            minion:updateEnmity(target)
        end
    end
end

function onMobWeaponSkill(target, mob, skill)
    if mob:getLocalVar("spawnedMinions") == 0 then
        spawnMinions(mob, target)
    end
end

function onMobDeath(mob, player, isKiller)
end