-----------------------------------------
--  Spell: Poisonga III
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    local effect = EFFECT_POISON;
    local duration = 60;

    pINT = caster:getStat(MOD_INT);
    mINT = target:getStat(MOD_INT);

    dINT = (pINT - mINT);
    local power = caster:getSkillLevel(ENFEEBLING_MAGIC_SKILL) / 10 + 1;
    if power > 25 then
        power = 25;
    end

    if(math.random(0,100) >= target:getMod(MOD_POISONRES)) then
        bonus = AffinityBonus(caster, spell);
        resist = applyResistance(caster,spell,target,dINT,ENFEEBLING_MAGIC_SKILL,bonus);
        if(resist == 1 or resist == 0.5) then -- effect taken
            duration = duration / resist;

            if(target:addStatusEffect(effect,power,3,duration)) then
                spell:setMsg(236);
            else
                spell:setMsg(75);
            end

        else -- resist entirely.
                spell:setMsg(85);
        end
    else
        spell:setMsg(284);
    end
    return effect;
end;