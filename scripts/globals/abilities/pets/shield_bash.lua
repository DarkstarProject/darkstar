---------------------------------------------
--  Shield Bash
---------------------------------------------
require("scripts/globals/status")
require("scripts/globals/settings")
require("scripts/globals/automatonweaponskills")

---------------------------------------------------

function onMobSkillCheck(target, automaton, skill)
    return 0
end

function onPetAbility(target, automaton, skill, master, action)
    local chance = 90
    local damage = (automaton:getSkillLevel(dsp.skill.AUTOMATON_MELEE)/2) + automaton:getMod(dsp.mod.SHIELD_BASH)

    damage = math.floor(damage)

    chance = chance + (automaton:getMainLvl() - target:getMainLvl()) * 5

    if math.random() * 100 < chance then
        target:addStatusEffect(dsp.effect.STUN, 1, 0, 6)
    end

    local slowPower = automaton:getMod(dsp.mod.AUTO_SHIELD_BASH_SLOW)
    if slowPower > 0 then
        local duration = 20
        if slowPower == 12 then
            duration = math.random(20, 35)
        elseif slowPower == 19 then
            duration = math.random(51, 57)
        elseif slowPower == 25 then
            duration = math.random(70, 75)
        end
        target:addStatusEffect(dsp.effect.SLOW, slowPower * 100, 0, duration)
    end

    -- randomize damage
    local ratio = automaton:getStat(dsp.mod.ATT)/target:getStat(dsp.mod.DEF)
    if ratio > 1.3 then
        ratio = 1.3
    end
    if ratio < 0.2 then
        ratio = 0.2
    end

    local pdif = math.random(ratio*0.8*1000, ratio*1.2*1000)

    damage = damage * (pdif / 1000)

    damage = utils.stoneskin(target, damage)
    target:takeDamage(damage, automaton, dsp.attackType.PHYSICAL, dsp.damageType.BLUNT)
    target:updateEnmityFromDamage(automaton, damage)
    target:addEnmity(automaton, 450, 900)

    return damage
end
