-----------------------------------------
-- Spell: Silence
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    local effectType = EFFECT_SILENCE;

    --Pull base stats.
    dINT = (caster:getStat(MOD_MND) - target:getStat(MOD_MND));
    bonus = AffinityBonus(caster,spell);

    --Duration, including resistance.  May need more research.
    duration = 180;

    --Resist
    resist = applyResistance(caster,spell,target,dINT,35,bonus);

    if(target:hasStatusEffect(effectType)) then
        spell:setMsg(75); -- no effect
        return effectType;
    end

    if(100 * math.random() >= target:getMod(MOD_SILENCERES)) then
        if(resist >= 0.5) then --Do it!
            target:addStatusEffect(effectType,1,0,duration * resist);
            spell:setMsg(236);
        else
            spell:setMsg(85);
        end
    else
        spell:setMsg(85); -- resist
    end


    return effectType;

end;