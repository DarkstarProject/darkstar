-----------------------------------------
-- Spell: Regen III
-- Gradually restores target's HP.
-----------------------------------------
-- Cleric's Briault enhances the effect
-- Scale down duration based on level
-- Composure increases duration 3x
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

    local hp = 20;
    local meritBonus = caster:getMerit(MERIT_REGEN_EFFECT);

    --printf("Regen III: Merit Bonus = Extra +%d", meritBonus);    

    local body = caster:getEquipID(SLOT_BODY);
    if (body == 15089 or body == 14502) then
        hp = hp+3;
    end

    hp = hp + caster:getMod(MOD_REGEN_EFFECT) + meritBonus;

    local duration = 60;

    duration = duration + caster:getMod(MOD_REGEN_DURATION);

    duration = calculateDurationForLvl(duration, 66, target:getMainLvl());

    if (target:hasStatusEffect(EFFECT_REGEN) and target:getStatusEffect(EFFECT_REGEN):getTier() == 1) then
        target:delStatusEffect(EFFECT_REGEN);
    end

    if (target:addStatusEffect(EFFECT_REGEN,hp,3,duration,0,0,0)) then
        spell:setMsg(230);
    else
        spell:setMsg(75); -- no effect
    end

    return EFFECT_REGEN;
end;