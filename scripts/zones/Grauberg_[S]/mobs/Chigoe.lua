-----------------------------------
-- Area: Grauberg [S]
--  MOB: Chigoe
-----------------------------------
mixins = { require("scripts/mixins/families/chigoe") }
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
end

function onMobEngaged(mob, target)
end

function onMobDisengage(mob)
end

function onCriticalHit(mob)
    if mob:getHP() > 0 then
        mob:setMobMod(dsp.mobMod.EXP_BONUS, -100)
        mob:setHP(0)
    end
end

function onWeaponskillHit(mob, attacker, weaponskill)
    if mob:getHP() > 0 then
        mob:setMobMod(dsp.mobMod.EXP_BONUS, -100)
        mob:setHP(0)
    end
end

function onMobDeath(mob, player, isKiller)
end
