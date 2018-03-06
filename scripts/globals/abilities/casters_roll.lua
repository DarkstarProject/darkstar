-----------------------------------
-- Ability: Caster's Roll
-- Enhances "Fast Cast" effect for party members within area of effect. 
-- Optimal Job: None
-- Lucky Number: 2
-- Unlucky Number: 7
-- Level: 79
-- Phantom Roll +1 Value: 3
--
-- Die Roll    | Fast Cast%   
-- --------    -------  
-- 1           |+6
-- 2           |+15     
-- 3           |+7     
-- 4           |+8     
-- 5           |+9     
-- 6           |+10     
-- 7           |+5     
-- 8           |+11      
-- 9           |+12    
-- 10          |+13     
-- 11          |+20     
-- Bust        |-10    
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/ability");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    local effectID = EFFECT_CASTERS_ROLL
    ability:setRange(ability:getRange() + player:getMod(MOD_ROLL_RANGE));
    if (player:hasStatusEffect(effectID)) then
        return msgBasic.ROLL_ALREADY_ACTIVE,0;
    elseif atMaxCorsairBusts(player) then
        return msgBasic.CANNOT_PERFORM,0;
    else
        return 0,0;
    end
end;

function onUseAbility(caster,target,ability,action)
    if (caster:getID() == target:getID()) then
        corsairSetup(caster, ability, action, EFFECT_CASTERS_ROLL, JOBS.COR);
    end
    local total = caster:getLocalVar("corsairRollTotal")
    return applyRoll(caster,target,ability,action,total)
end;

function applyRoll(caster,target,ability,action,total)
    local duration = 300 + caster:getMerit(MERIT_WINNING_STREAK) + caster:getMod(MOD_PHANTOM_DURATION)
    local effectpowers = {6, 15, 7, 8, 9, 10, 5, 11, 12, 13, 20, -10}
    local effectpower = effectpowers[total];
-- Apply Buffs from Tacticians Roll Enhancing Gear if present
    local equippedEnh = caster:getEquipID(SLOT_LEGS);
    if (equippedEnh == 11240) then -- Navarch's Culottes +1
        if (math.random(0, 99) < 50) then  -- 50% Chance to buff roll if equipped
            effectpower = effectpower + 10
        end
    end
    if ((equippedEnh == 11140) or (equippedEnh == 27269) or (equippedEnh == 27270)) then -- Navarch's Culottes +2 / Chasseur's Culottes / +1
        effectpower = effectpower + 10
    end
-- Check for MOD_PHANTOM_ROLL Value and apply non-stack logic.
    local phantomValue = caster:getMod(MOD_PHANTOM_ROLL);
    local phantombuffValue = 0;
    local phantomBase = 3; -- Base increment buff
    if (phantomValue == 3) then
        phantombuffMultiplier = 3;
    elseif ((phantomValue == 5) or (phantomValue == 8)) then
        phantombuffMultiplier = 5;
    elseif ((phantomValue == 7) or (phantomValue == 10) or (phantomValue == 12) or (phantomValue == 15)) then
        phantombuffMultiplier = 7;
    else
        phantombuffMultiplier = 0;
    end
-- Apply Additional Phantom Roll+ Buff
    local phantombuffValue = phantomBase * phantombuffMultiplier;
    local effectpower = effectpower + phantombuffValue
-- Check if COR Main or Sub
    if (caster:getMainJob() == JOBS.COR and caster:getMainLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getMainLvl() / target:getMainLvl());
    elseif (caster:getSubJob() == JOBS.COR and caster:getSubLvl() < target:getMainLvl()) then
        effectpower = effectpower * (caster:getSubLvl() / target:getMainLvl());
    end
    if (target:addCorsairRoll(caster:getMainJob(), caster:getMerit(MERIT_BUST_DURATION), EFFECT_CASTERS_ROLL, effectpower, 0, duration, caster:getID(), total, MOD_FASTCAST) == false) then
        ability:setMsg(msgBasic.ROLL_MAIN_FAIL);
    elseif total > 11 then
        ability:setMsg(msgBasic.DOUBLEUP_BUST);
    end
    return total;
end
