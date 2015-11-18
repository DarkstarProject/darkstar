-----------------------------------------
-- Spell: Battlefield Elegy
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
    local duration = 120;
    local power = 256;

    local pCHR = caster:getStat(MOD_CHR);
    local mCHR = target:getStat(MOD_CHR);
    local dCHR = (pCHR - mCHR);
    local resm = applyResistance(caster,spell,target,dCHR,SINGING_SKILL,0);
    if (resm < 0.5) then
        spell:setMsg(85);--resist message
        return 1;
    end

    if (100 * math.random() < target:getMod(MOD_SLOWRES)) then
        spell:setMsg(85); -- resisted spell
    else
        local iBoost = caster:getMod(MOD_ELEGY_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT);
        power = power + iBoost*10;
        
        if (caster:hasStatusEffect(EFFECT_SOUL_VOICE)) then
            power = power * 2;
        elseif (caster:hasStatusEffect(EFFECT_MARCATO)) then
            power = power * 1.5;
        end
        caster:delStatusEffect(EFFECT_MARCATO);
        
        duration = duration * ((iBoost * 0.1) + (caster:getMod(MOD_SONG_DURATION_BONUS)/100) + 1);
        
        if (caster:hasStatusEffect(EFFECT_TROUBADOUR)) then
            duration = duration * 2;
        end

        -- Try to overwrite weaker elegy
        if (target:addStatusEffect(EFFECT_ELEGY,power,0,duration)) then
            spell:setMsg(237);
        else
            spell:setMsg(75); -- no effect
        end

    end

    return EFFECT_ELEGY;
end;