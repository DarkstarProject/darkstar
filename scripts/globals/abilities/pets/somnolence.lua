---------------------------------------------------
-- Somnolence
---------------------------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/monstertpmoves")
require("scripts/globals/magic")

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onPetAbility(target, pet, skill)
    local dmg = 10 + pet:getMainLvl() * 2
    local resist = applyPlayerResistance(pet,-1,target, 0, dsp.skill.ELEMENTAL_MAGIC, dsp.magic.ele.DARK)
    local duration = 120

    dmg = dmg*resist
    dmg = mobAddBonuses(pet,spell,target,dmg, dsp.magic.ele.DARK)
    dmg = finalMagicAdjustments(pet,target,spell,dmg)

    if (resist < 0.15) then  --the gravity effect from this ability is more likely to land than Tail Whip
        resist = 0
    end

    duration = duration * resist

    if (duration > 0 and target:hasStatusEffect(dsp.effect.WEIGHT) == false) then
        target:addStatusEffect(dsp.effect.WEIGHT, 50, 0, duration)
    end

    return dmg
end