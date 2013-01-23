-----------------------------------------
-- Spell: Battlefield Elegy
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    duration = 120;
    power = 25;

    bonus = AffinityBonus(caster, spell);
    pCHR = caster:getStat(MOD_CHR);
    mCHR = target:getStat(MOD_CHR);
    dCHR = (pCHR - mCHR);
    resm = applyResistance(caster,spell,target,dCHR,SINGING_SKILL,bonus);
    if(resm < 0.5) then
        spell:setMsg(85);--resist message
        return 1;
    end

    if(100 * math.random() < target:getMod(MOD_SLOWRES)) then
        spell:setMsg(85); -- resisted spell
    else
        local sItem = caster:getEquipID(2);

        -- horn +1
        if(sItem == 17371) then
            power = power + 2;
            duration = duration * 1.2;
        end

        if(sItem == 17352) then
            power = power + 1;
            duration = duration * 1.1;
        end

        if(sItem == 18342) then
            power = power + 2;
            duration = duration * 1.2;
        end

        if(sItem == 17856) then
            power = power + 3;
            duration = duration * 1.3;
        end

        -- Try to overwrite weaker slow / haste
        if(canOverwrite(target, EFFECT_SLOW, power) and canOverwrite(target, EFFECT_HASTE, -1)) then
            -- overwrite them
            target:delStatusEffect(EFFECT_HASTE);
            target:delStatusEffect(EFFECT_SLOW);
            target:addStatusEffect(EFFECT_SLOW,power,0,duration);
            spell:setMsg(237);
        else
            spell:setMsg(75); -- no effect
        end

    end

    return EFFECT_SLOW;
end;