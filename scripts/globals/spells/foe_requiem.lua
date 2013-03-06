-----------------------------------------
-- Spell: Foe Requiem
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
    local effect = EFFECT_REQUIEM;
    local duration = 63;
    local power = 1;

    bonus = AffinityBonus(caster, spell);
    pCHR = caster:getStat(MOD_CHR);
    mCHR = target:getStat(MOD_CHR);
    dCHR = (pCHR - mCHR);
    resm = applyResistance(caster,spell,target,dCHR,SINGING_SKILL,bonus);
    if(resm < 0.5) then
        spell:setMsg(85);--resist message
        return 1;
    end

    local sItem = caster:getEquipID(2);

    -- flute +1
    if(sItem == 17372) then
        power = power + 1;
    end

    if(sItem == 17844) then
        power = power + 1;
    end

    if(sItem == 17346) then
        power = power + 2;
    end

    if(sItem == 17379) then
        power = power + 2;
    end

    if(sItem == 17362) then
        power = power + 2;
    end

    if(sItem == 17832) then
        power = power + 3;
    end

    if(sItem == 17852) then
        power = power + 4;
    end

    if(sItem == 18342) then
        power = power + 2;
    end

    -- Try to overwrite weaker slow / haste
    if(canOverwrite(target, effect, power)) then
        -- overwrite them
        target:delStatusEffect(effect);
        target:addStatusEffect(effect,power,3,duration);
        spell:setMsg(237);
    else
        spell:setMsg(75); -- no effect
    end

    return effect;
end;