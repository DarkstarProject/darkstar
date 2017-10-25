-----------------------------------------
-- Spell: Sleep I
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local duration = 60;
    local pINT = caster:getStat(MOD_INT);
    local mINT = target:getStat(MOD_INT);
    local dINT = (pINT - mINT);
    local params = {};
    params.diff = nil;
    params.attribute = MOD_INT;
    params.skillType = ENFEEBLING_MAGIC_SKILL;
    params.bonus = 0;
    params.effect = EFFECT_SLEEP_I;
    resm = applyResistanceEffect(caster, target, spell, params);

    if (caster:isMob()) then
        if (caster:getPool() == 5310) then -- Amnaf (Flayer)
            caster:resetEnmity(target);
        end
        -- Todo: get rid of this whole block by handling it in the mob script
        -- this requires a multi target enmity without specifying a target (have to get hate list from mob)
        -- OR by altering onSpellPrecast to have a target param..
        -- onMonsterMagicPrepare is not a realistic option.
        -- You'd have to script the use of every individual spell in Amnaf's list..
    end

    if (resm < 0.5) then
        spell:setMsg(msgBasic.MAGIC_RESIST); -- Resist
        return EFFECT_SLEEP_I;
    end

    duration = duration * resm;

    if (target:addStatusEffect(EFFECT_SLEEP_I,1,0,duration)) then
        spell:setMsg(msgBasic.MAGIC_ENFEEB_IS);
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT); -- No effect
    end

    return EFFECT_SLEEP_I;
end;
