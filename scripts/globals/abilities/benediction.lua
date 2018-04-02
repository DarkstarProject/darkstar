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
    local removables = {EFFECT.FLASH, EFFECT.BLINDNESS, EFFECT.MAX_HP_DOWN, EFFECT.MAX_MP_DOWN, EFFECT.PARALYSIS, EFFECT.POISON,
                        EFFECT.CURSE_I, EFFECT.CURSE_II, EFFECT.DISEASE, EFFECT.PLAGUE, EFFECT.WEIGHT, EFFECT.BIND, 
                        EFFECT.BIO, EFFECT.DIA, EFFECT.BURN, EFFECT.FROST, EFFECT.CHOKE, EFFECT.RASP, EFFECT.SHOCK, EFFECT.DROWN, 
                        EFFECT.STR_DOWN, EFFECT.DEX_DOWN, EFFECT.VIT_DOWN, EFFECT.AGI_DOWN, EFFECT.INT_DOWN, EFFECT.MND_DOWN,
                        EFFECT.CHR_DOWN, EFFECT.ADDLE, EFFECT.SLOW, EFFECT.HELIX, EFFECT.ACCURACY_DOWN, EFFECT.ATTACK_DOWN,
                        EFFECT.EVASION_DOWN, EFFECT.DEFENSE_DOWN, EFFECT.MAGIC_ACC_DOWN, EFFECT.MAGIC_ATK_DOWN, EFFECT.MAGIC_EVASION_DOWN,
                        EFFECT.MAGIC_DEF_DOWN, EFFECT.MAX_TP_DOWN, EFFECT.SILENCE};

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
