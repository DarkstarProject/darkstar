-----------------------------------
-- Ability: Benediction
-- Restores a large amount of HP and removes (almost) all status ailments for party members within area of effect.
-- Obtained: White Mage Level 1
-- Recast Time: 1:00:00
-- Duration: Instant
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

function onUseAbility(player,target,ability)
    -- To Do: Benediction can remove Charm only while in Assault Mission Lamia No.13
    local removables = {dsp.effects.FLASH, dsp.effects.BLINDNESS, dsp.effects.MAX_HP_DOWN, dsp.effects.MAX_MP_DOWN, dsp.effects.PARALYSIS, dsp.effects.POISON,
                        dsp.effects.CURSE_I, dsp.effects.CURSE_II, dsp.effects.DISEASE, dsp.effects.PLAGUE, dsp.effects.WEIGHT, dsp.effects.BIND, 
                        dsp.effects.BIO, dsp.effects.DIA, dsp.effects.BURN, dsp.effects.FROST, dsp.effects.CHOKE, dsp.effects.RASP, dsp.effects.SHOCK, dsp.effects.DROWN, 
                        dsp.effects.STR_DOWN, dsp.effects.DEX_DOWN, dsp.effects.VIT_DOWN, dsp.effects.AGI_DOWN, dsp.effects.INT_DOWN, dsp.effects.MND_DOWN,
                        dsp.effects.CHR_DOWN, dsp.effects.ADDLE, dsp.effects.SLOW, dsp.effects.HELIX, dsp.effects.ACCURACY_DOWN, dsp.effects.ATTACK_DOWN,
                        dsp.effects.EVASION_DOWN, dsp.effects.DEFENSE_DOWN, dsp.effects.MAGIC_ACC_DOWN, dsp.effects.MAGIC_ATK_DOWN, dsp.effects.MAGIC_EVASION_DOWN,
                        dsp.effects.MAGIC_DEF_DOWN, dsp.effects.MAX_TP_DOWN, dsp.effects.SILENCE};

    for i, effect in ipairs(removables) do
        if (target:hasStatusEffect(effect)) then
            target:delStatusEffect(effect);
        end;
    end;

    local heal = (target:getMaxHP() * player:getMainLvl()) / target:getMainLvl();

    local maxHeal = target:getMaxHP() - target:getHP();

    if (heal > maxHeal) then
        heal = maxHeal;
    end

    player:updateEnmityFromCure(target,heal);
    target:addHP(heal);
    target:wakeUp();

    return heal;
end;
