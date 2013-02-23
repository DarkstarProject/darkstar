-----------------------------------------
-- Spell: Horde Lullaby
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    duration = 30;
    bonus = AffinityBonus(caster, spell);
    pCHR = caster:getStat(MOD_CHR);
    mCHR = target:getStat(MOD_CHR);
    dCHR = (pCHR - mCHR);
    resm = applyResistance(caster,spell,target,dCHR,40,bonus);
    if(resm < 0.5) then
        spell:setMsg(85);--resist message
        return EFFECT_LULLABY;
    end

    if(target:hasImmunity(1) or 100 * math.random() < target:getMod(MOD_SLEEPRES)) then
        --No effect
        spell:setMsg(75);
    else
        -- add equipment bonus
        local sItem = caster:getEquipID(2);

        -- Mary's Horn
        if(sItem == 17366) then
            duration = duration * 1.1;
        end

        if(sItem == 17841 or sItem == 17854) then
            duration = duration * 1.2;
        end

        if(target:addStatusEffect(EFFECT_LULLABY,1,0,duration)) then
            spell:setMsg(237);
        else
            spell:setMsg(75);
        end
    end

    return EFFECT_LULLABY;
end;