-----------------------------------------
--	Spell: Poison
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    local effect = EFFECT_POISON;
    local duration = 30;

    pINT = caster:getStat(MOD_INT);
    mINT = target:getStat(MOD_INT);

    dINT = (pINT - mINT);
	local power = caster:getSkillLevel(ENFEEBLING_MAGIC_SKILL) / 25 + 1;
	if power > 4 then
		power = 4;
	end

    if(math.random(0,100) >= target:getMod(MOD_POISONRES)) then
        bonus = AffinityBonus(caster, spell);
        resist = applyResistance(caster,spell,target,dINT,ENFEEBLING_MAGIC_SKILL,bonus);
        if(resist == 1 or resist == 0.5) then -- effect taken
            duration = duration / resist;

            -- Try to erase a weaker poison.
            poison = target:getStatusEffect(effect)
            if(poison ~= nil) then
                if(poison:getPower() < power) then
                    -- remove weaker poison
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