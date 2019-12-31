-----------------------------------
-- Area: Sealions Den
--   NM: Ultima
-----------------------------------
require("scripts/globals/titles")
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.EXP_BONUS, -100)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
    mob:setMobMod(dsp.mobMod.GIL_MAX, -1)
end

function onMobFight(mob, target)
    -- Gains regain at under 25% HP
    if mob:getHPP() < 25 and not mob:hasStatusEffect(dsp.effect.REGAIN) then
        mob:addStatusEffect(dsp.effect.REGAIN, 5, 3, 0)
        mob:getStatusEffect(dsp.effect.REGAIN):setFlag(dsp.effectFlag.DEATH)
    end
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.PARALYZE, {duration = 60})
end

function onMobDeath(mob, player, isKiller)
    mob:getBattlefield():setLocalVar("loot", 0)
    player:addTitle(dsp.title.ULTIMA_UNDERTAKER)
    player:setLocalVar("[OTBF]cs", 0)
end
