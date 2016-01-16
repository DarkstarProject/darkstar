-----------------------------------
-- Ability: Benediction
-- Restores a large amount of HP and removes (almost) all status ailments for party members within area of effect.
-- Obtained: White Mage Level 1
-- Recast Time: 1:00:00
-- Duration: Instant
-----------------------------------

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    -- To Do: Benediction can remove Charm only while in Assault Mission Lamia No.13
    local removables = {EFFECT_FLASH, EFFECT_BLINDNESS, EFFECT_MAX_HP_DOWN, EFFECT_MAX_MP_DOWN, EFFECT_PARALYSIS, EFFECT_POISON,
                        EFFECT_CURSE_I, EFFECT_CURSE_II, EFFECT_DISEASE, EFFECT_PLAGUE, EFFECT_WEIGHT, EFFECT_BIND, 
                        EFFECT_BIO, EFFECT_DIA, EFFECT_BURN, EFFECT_FROST, EFFECT_CHOKE, EFFECT_RASP, EFFECT_SHOCK, EFFECT_DROWN, 
                        EFFECT_STR_DOWN, EFFECT_DEX_DOWN, EFFECT_VIT_DOWN, EFFECT_AGI_DOWN, EFFECT_INT_DOWN, EFFECT_MND_DOWN,
                        EFFECT_CHR_DOWN, EFFECT_ADDLE, EFFECT_SLOW, EFFECT_HELIX, EFFECT_ACCURACY_DOWN, EFFECT_ATTACK_DOWN,
                        EFFECT_EVASION_DOWN, EFFECT_DEFENSE_DOWN, EFFECT_MAGIC_ACC_DOWN, EFFECT_MAGIC_ATK_DOWN, EFFECT_MAGIC_EVASION_DOWN,
                        EFFECT_MAGIC_DEF_DOWN, EFFECT_MAX_TP_DOWN, EFFECT_SILENCE};

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
