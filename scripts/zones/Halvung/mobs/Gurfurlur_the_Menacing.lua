-----------------------------------
-- Area: Halvung
-- MOB: Gurfurlur the Menacing
-- !pos -59.000 -23.000 3.000 62
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/status")
require("scripts/zones/Halvung/MobIDs")
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobEngaged(mob,target)
    for i = GURFURLUR_THE_MENACING + 1, GURFURLUR_THE_MENACING + 4 do
        SpawnMob(i):updateEnmity(target)
    end
end

function onMobFight(mob,target)
    if (mob:getBattleTime() % 60 < 2 and mob:getBattleTime() > 10) then
        if (not GetMobByID(GURFURLUR_THE_MENACING + 1):isSpawned()) then
            GetMobByID(GURFURLUR_THE_MENACING + 1):setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5))
            SpawnMob(GURFURLUR_THE_MENACING + 1):updateEnmity(target)
        elseif (not GetMobByID(GURFURLUR_THE_MENACING + 2):isSpawned()) then
            GetMobByID(GURFURLUR_THE_MENACING + 2):setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5))
            SpawnMob(GURFURLUR_THE_MENACING + 2):updateEnmity(target)
        elseif (not GetMobByID(GURFURLUR_THE_MENACING + 3):isSpawned()) then
            GetMobByID(GURFURLUR_THE_MENACING + 3):setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5))
            SpawnMob(GURFURLUR_THE_MENACING + 3):updateEnmity(target)
        elseif (not GetMobByID(GURFURLUR_THE_MENACING + 4):isSpawned()) then
            GetMobByID(GURFURLUR_THE_MENACING + 4):setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5))
            SpawnMob(GURFURLUR_THE_MENACING + 4):updateEnmity(target)
        end
    end
    for i = GURFURLUR_THE_MENACING + 1, GURFURLUR_THE_MENACING + 4 do
        local pet = GetMobByID(i)
        if (pet:getCurrentAction() == dsp.act.ROAMING) then
            pet:updateEnmity(target)
        end
    end
end

function onMobDisengage(mob)
    for i = 1,4 do DespawnMob(GURFURLUR_THE_MENACING + i) end
end

function onMobDeath(mob, player, isKiller)
    player:addTitle(dsp.title.TROLL_SUBJUGATOR)
    for i = 1,4 do DespawnMob(GURFURLUR_THE_MENACING + i) end
end

function onMobDespawn(mob)
    for i = 1,4 do DespawnMob(GURFURLUR_THE_MENACING + i) end
end