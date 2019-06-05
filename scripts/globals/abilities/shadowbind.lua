-----------------------------------
-- Ability: Shadowbind
-- Roots enemy in place.
-- Obtained: Ranger Level 40
-- Recast Time: 5:00
-- Duration: 00:30
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onAbilityCheck(player,target,ability)
    if ((player:getWeaponSkillType(dsp.slot.RANGED) == dsp.skill.MARKSMANSHIP and player:getWeaponSkillType(dsp.slot.AMMO) == dsp.skill.MARKSMANSHIP) or
    (player:getWeaponSkillType(dsp.slot.RANGED) == dsp.skill.ARCHERY and player:getWeaponSkillType(dsp.slot.AMMO) == dsp.skill.ARCHERY)) then
        return 0,0
    end
    return 216,0 -- You do not have an appropriate ranged weapon equipped.
end

function onUseAbility(player,target,ability,action)

    if (player:getWeaponSkillType(dsp.slot.RANGED) == dsp.skill.MARKSMANSHIP) then -- can't have your crossbow/gun held like a bow, now can we?
        action:animation(target:getID(), action:animation(target:getID()) + 1)
    end

    local duration = 30 + player:getMod(dsp.mod.SHADOW_BIND_EXT)
    local recycleChance = player:getMod(dsp.mod.RECYCLE) + player:getMerit(dsp.merit.RECYCLE)
    if (player:hasStatusEffect(dsp.effect.UNLIMITED_SHOT)) then
        player:delStatusEffect(dsp.effect.UNLIMITED_SHOT)
        recycleChance = 100
    end

     -- TODO: Acc penalty for /RNG, acc vs. mob level?
    if (math.random(0, 99) >= target:getMod(dsp.mod.BINDRES) and target:hasStatusEffect(dsp.effect.BIND) == false) then
        target:addStatusEffect(dsp.effect.BIND, 0, 0, duration)
        ability:setMsg(dsp.msg.basic.IS_EFFECT) -- Target is bound.
    else
        ability:setMsg(dsp.msg.basic.JA_MISS) -- Player uses Shadowbind, but misses.
    end

    if (math.random(0, 99) >= recycleChance) then
        player:removeAmmo() -- Shadowbind depletes one round of ammo.
    end

    return dsp.effect.BIND
end
