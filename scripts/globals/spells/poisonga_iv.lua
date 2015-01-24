-----------------------------------------
--  Spell: Poisonga IV
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
    local effect = EFFECT_POISON;
    local duration = 150;

    local pINT = caster:getStat(MOD_INT);
    local mINT = target:getStat(MOD_INT);

    local dINT = (pINT - mINT);
    local power = caster:getSkillLevel(ENFEEBLING_MAGIC_SKILL) / 10 + 1;
    if power > 50 then
        power = 50;
    end

    if(math.random(0,100) >= target:getMod(MOD_POISONRES)) then
        local bonus = AffinityBonus(caster, spell:getElement());
        local resist = applyResistance(caster,spell,target,dINT,ENFEEBLING_MAGIC_SKILL,bonus);
        if(resist == 1 or resist == 0.5) then -- effect taken
            duration = duration / resist;

            -- Try to erase a weaker poison.
            local poison = target:getStatusEffect(effect)
            if(poison ~= nil) then
                if(poison:getPower() < power) then
                    -- remove weaker poison
                    target:delStatusEffect(effect);
                    target:addStatusEffect(effect,power,3,duration);
                    spell:setMsg(236);
                else
                    -- no effect
                    spell:setMsg(75);
                end
            else
                target:addStatusEffect(effect,power,3,duration);
                spell:setMsg(236);
            end

        else -- resist entirely.
                spell:setMsg(85);
        end
    else
        spell:setMsg(284);
    end
    return effect;
end;