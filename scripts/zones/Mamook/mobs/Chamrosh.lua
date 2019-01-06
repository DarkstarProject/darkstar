-----------------------------------
-- Area: Mamook
--  ZNM: Chamrosh (Tier-1 ZNM)
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("changeTime",150)
    mob:setLocalVar("useWise", math.random(25,50))
    mob:addMod(dsp.mod.UFASTCAST,150)
end

function onMobFight(mob, target)
    local delay = mob:getLocalVar("delay")
    local LastCast = mob:getLocalVar("LAST_CAST")
    local spell = mob:getLocalVar("COPY_SPELL")
    local changeTime = mob:getLocalVar("changeTime")

    if spell > 0 and mob:hasStatusEffect(dsp.effect.SILENCE) == false then
        if delay >= 3 then
            mob:castSpell(spell)
            mob:setLocalVar("COPY_SPELL", 0)
            mob:setLocalVar("delay", 0)
        else
            mob:setLocalVar("delay", delay+1)
        end
    end
    if mob:getHPP() < mob:getLocalVar("useWise") and mob:getLocalVar("usedMainSpec") == 0 then
        mob:useMobAbility(1702)
        mob:setLocalVar("usedMainSpec",1)
    end
    if mob:getBattleTime() == changeTime then
        if mob:AnimationSub() == 0 then
            mob:AnimationSub(1)
            mob:setSpellList(0)
            mob:setLocalVar("changeTime", mob:getBattleTime() + 150)
        else
            mob:AnimationSub(0)
            mob:setSpellList(300)
            mob:setLocalVar("changeTime", mob:getBattleTime() + 150)
        end
    end
end

function onMagicHit(caster, target, spell)
    if spell:tookEffect() and target:AnimationSub() == 1 and (caster:isPC() or caster:isPet()) then
        target:setLocalVar("COPY_SPELL", spell:getID())
        target:setLocalVar("LAST_CAST", target:getBattleTime())
    end

    return 1
end

function onMobDeath(mob, player, isKiller)
end