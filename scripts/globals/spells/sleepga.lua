-----------------------------------------
-- Spell: Sleep I
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
    local duration = 60;
    local pINT = caster:getStat(MOD_INT);
    local mINT = target:getStat(MOD_INT);
    local dINT = (pINT - mINT);
    local resm = applyResistanceEffect(caster,spell,target,dINT,ENFEEBLING_MAGIC_SKILL,0,EFFECT_SLEEP_I);

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
        spell:setMsg(85); -- Resist
        return EFFECT_SLEEP_I;
    end

    duration = duration * resm;

    if (target:addStatusEffect(EFFECT_SLEEP_I,1,0,duration)) then
        spell:setMsg(236);
    else
        spell:setMsg(75); -- No effect
    end

    return EFFECT_SLEEP_I;
end;