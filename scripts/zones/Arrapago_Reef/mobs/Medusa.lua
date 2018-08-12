-----------------------------------
-- Area: Arrapago Reef
--  MOB: Medusa
-- !pos -458 -20 458
-- TODO: resists, attack/def boosts
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/zones/Arrapago_Reef/TextIDs")
require("scripts/zones/Arrapago_Reef/MobIDs")
require("scripts/globals/status")
require("scripts/globals/titles")
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("mainSpec", dsp.jsa.EES_LAMIA)
    mob:setLocalVar("useSpecAtHpMin", 5)
    mob:setLocalVar("useSpecAtHpMax", 99)
    mob:setLocalVar("useMainSpecAtHPP", math.random(5,99))
end

function onMobEngaged(mob, target)
    target:showText(mob, MEDUSA_ENGAGE)
    for i = MEDUSA + 1, MEDUSA + 4 do
        SpawnMob(i):updateEnmity(target)
    end
end

function onMobFight(mob, target)
    if (mob:getBattleTime() % 60 < 2 and mob:getBattleTime() > 10) then
        if (not GetMobByID(MEDUSA + 1):isSpawned()) then
            GetMobByID(MEDUSA + 1):setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5))
            SpawnMob(MEDUSA + 1):updateEnmity(target)
        elseif (not GetMobByID(MEDUSA + 2):isSpawned()) then
            GetMobByID(MEDUSA + 2):setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5))
            SpawnMob(MEDUSA + 2):updateEnmity(target)
        elseif (not GetMobByID(MEDUSA + 3):isSpawned()) then
            GetMobByID(MEDUSA + 3):setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5))
            SpawnMob(MEDUSA + 3):updateEnmity(target)
        elseif (not GetMobByID(MEDUSA + 4):isSpawned()) then
            GetMobByID(MEDUSA + 4):setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5))
            SpawnMob(MEDUSA + 4):updateEnmity(target)
        end
    end
    for i = MEDUSA + 1, MEDUSA + 4 do
        local pet = GetMobByID(i)
        if (pet:getCurrentAction() == dsp.act.ROAMING) then
            pet:updateEnmity(target)
        end
    end
end

function onMobDisengage(mob)
    for i = 1,4 do DespawnMob(MEDUSA + i) end
end

function onMobDeath(mob, player, isKiller)
    player:showText(mob, MEDUSA_DEATH)
    player:addTitle(dsp.title.GORGONSTONE_SUNDERER)
    for i = 1,4 do DespawnMob(MEDUSA + i) end
end

function onMobDespawn(mob)
    for i = 1,4 do DespawnMob(MEDUSA + i) end
end