-----------------------------------------
--  Spell: Poison
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    local effect = EFFECT_POISON;
    local duration = 120;
    potency = caster:getSkillLevel(ENFEEBLING_MAGIC_SKILL) / 15;
    if potency > 10 then
        potency = 10;
    end

    if(math.random(0,100) >= target:getMod(MOD_POISONRES)) then
        bonus = AffinityBonus(caster, spell);
        resist = applyResistance(caster,spell,target,dMND,35,bonus);
        if(resist == 1) then -- Full hit, no duration penalty
            target:addStatusEffect(effect,potency,0,duration);
                spell:setMsg(237);
        elseif(resist == 0.5) then -- Half duration
            duration = duration / 2;
            target:addStatusEffect(effect,potency,0,duration);
                spell:setMsg(237);
        else -- resist entirely.
                spell:setMsg(85);
        end
    else
        spell:setMsg(284);
    end
    return effect;
end;