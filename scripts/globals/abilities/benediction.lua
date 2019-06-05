-----------------------------------
-- Ability: Benediction
-- Restores a large amount of HP and removes (almost) all status ailments for party members within area of effect.
-- Obtained: White Mage Level 1
-- Recast Time: 1:00:00
-- Duration: Instant
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0
end

function onUseAbility(player,target,ability)
    -- To Do: Benediction can remove Charm only while in Assault Mission Lamia No.13
    local removables = {dsp.effect.FLASH, dsp.effect.BLINDNESS, dsp.effect.MAX_HP_DOWN, dsp.effect.MAX_MP_DOWN, dsp.effect.PARALYSIS, dsp.effect.POISON,
                        dsp.effect.CURSE_I, dsp.effect.CURSE_II, dsp.effect.DISEASE, dsp.effect.PLAGUE, dsp.effect.WEIGHT, dsp.effect.BIND,
                        dsp.effect.BIO, dsp.effect.DIA, dsp.effect.BURN, dsp.effect.FROST, dsp.effect.CHOKE, dsp.effect.RASP, dsp.effect.SHOCK, dsp.effect.DROWN,
                        dsp.effect.STR_DOWN, dsp.effect.DEX_DOWN, dsp.effect.VIT_DOWN, dsp.effect.AGI_DOWN, dsp.effect.INT_DOWN, dsp.effect.MND_DOWN,
                        dsp.effect.CHR_DOWN, dsp.effect.ADDLE, dsp.effect.SLOW, dsp.effect.HELIX, dsp.effect.ACCURACY_DOWN, dsp.effect.ATTACK_DOWN,
                        dsp.effect.EVASION_DOWN, dsp.effect.DEFENSE_DOWN, dsp.effect.MAGIC_ACC_DOWN, dsp.effect.MAGIC_ATK_DOWN, dsp.effect.MAGIC_EVASION_DOWN,
                        dsp.effect.MAGIC_DEF_DOWN, dsp.effect.MAX_TP_DOWN, dsp.effect.SILENCE}

    for i, effect in ipairs(removables) do
        if (target:hasStatusEffect(effect)) then
            target:delStatusEffect(effect)
        end
    end

    local heal = (target:getMaxHP() * player:getMainLvl()) / target:getMainLvl()

    local maxHeal = target:getMaxHP() - target:getHP()

    if (heal > maxHeal) then
        heal = maxHeal
    end

    player:updateEnmityFromCure(target,heal)
    target:addHP(heal)
    target:wakeUp()

    return heal
end
