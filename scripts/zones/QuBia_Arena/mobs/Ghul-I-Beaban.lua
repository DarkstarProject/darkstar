-----------------------------------
-- Area: Qu'Bia Arena
--  Mob: Ghul-I-Beaban
-- BCNM: Undying Promise
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function reraiseGhul(mob, reraises, target)
    mob:setLocalVar("RERAISES", reraises)
    mob:setMod(dsp.mod.ATT, 25 * reraises)
    mob:setHP(mob:getMaxHP() * (1 - (0.10 * reraises)))
    mob:resetAI()
    mob:stun(3000)
    if target then
        mob:updateClaim(target)
    end
    if reraises == 4 then
        mob:getBattlefield():setLocalVar("lootSpawned", 0)
    end
end

function onMobInitialize(mob)
    mob:addListener("DEATH", "GHUL_DEATH", function(mob)
        local mobId = mob:getID()
        local reraises = mob:getLocalVar("RERAISES") + 1
        local target = mob:getTarget()

        -- spawn second form (BLM)
        if reraises == 3 then
            mob:timer(9000, function(mob)
                mob:setStatus(dsp.status.DISAPPEAR)
                local finalMobId = mobId + 1
                local finalMob = GetMobByID(finalMobId)
                finalMob:setSpawn(mob:getXPos(), mob:getYPos(), mob:getZPos())
                finalMob:spawn()
                reraiseGhul(finalMob, 3, target)
            end)
        -- reraise up to 4 times
        elseif reraises < 5 then
            mob:timer(9000, function(mob)
                reraiseGhul(mob, reraises, target)
            end)
        end
    end)
end

function onMobDeath(mob, player, isKiller)
end
