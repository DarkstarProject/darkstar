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
    local damage = (automaton:getSkillLevel(22)/2) + automaton:getMod(MOD_SHIELD_BASH)

    damage = math.floor(damage)

    chance = chance + (automaton:getMainLvl() - target:getMainLvl())*5

    if math.random()*100 < chance then
        target:addStatusEffect(EFFECT_STUN, 1, 0, 6)
    end

    -- randomize damage
    local ratio = automaton:getStat(MOD_ATT)/target:getStat(MOD_DEF)
    if ratio > 1.3 then
        ratio = 1.3
    end
    if ratio < 0.2 then
        ratio = 0.2
    end

    local pdif = math.random(ratio*0.8*1000, ratio*1.2*1000)

    damage = damage * (pdif / 1000)

    target:delHP(damage)
    target:updateEnmityFromDamage(automaton, damage)
    target:addEnmity(automaton, 450, 900)

    return damage
end
