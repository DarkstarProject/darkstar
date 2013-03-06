-----------------------------------------
-- Spell: Battlefield Elegy
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
    duration = 180;
    power = 512;

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
            power = power + 20;
            duration = duration * 1.2;
        end

        if(sItem == 17352) then
            power = power + 11;
            duration = duration * 1.1;
        end

        if(sItem == 18342) then
            power = power + 20;
            duration = duration * 1.2;
        end

        if(sItem == 17856) then
            power = power + 30;
            duration = duration * 1.3;
        end

        -- Try to overwrite weaker elegy
        if(target:addStatusEffect(EFFECT_ELEGY,power,0,duration)) then
            spell:setMsg(237);
        else
            spell:setMsg(75); -- no effect
        end
    end

    return EFFECT_ELEGY;
end;