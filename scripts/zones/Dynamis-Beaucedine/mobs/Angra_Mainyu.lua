-----------------------------------
-- Area: Dynamis - Beaucedine
--  Mob: Angra Mainyu
-- Note: Mega Boss
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/dynamis")
require("scripts/globals/status")
-----------------------------------

function onMobEngaged(mob, target)
    local mobId = mob:getID()
    for i = mobId + 1, mobId + 4 do
        if not GetMobByID(i):isSpawned() then
            SpawnMob(i)
        end
    end
end

function onMobFight(mob, target)
    local mobId = mob:getID()
    for i = mobId + 1, mobId + 4 do
        local pet = GetMobByID(i)
        if pet:isSpawned() and pet:getCurrentAction() == dsp.act.ROAMING then
            pet:updateEnmity(target)
        end
    end
end

function onMonsterMagicPrepare(mob, target)
    if mob:getHPP() <= 25 then
        return 244 -- Death
    else
        -- Can cast Blindga, Death, Graviga, Silencega, and Sleepga II.
        -- Casts Graviga every time before he teleports.
        rnd = math.random()

        if rnd < 0.2 then
            return 361 -- Blindga
        elseif rnd < 0.4 then
             return 244 -- Death
        elseif rnd < 0.6 then
            return 366 -- Graviga
        elseif rnd < 0.8 then
            return 274 -- Sleepga II
        else
            return 359 -- Silencega
        end
    end
end

function onMobDeath(mob, player, isKiller)
    dynamis.megaBossOnDeath(mob, player, isKiller)
end
