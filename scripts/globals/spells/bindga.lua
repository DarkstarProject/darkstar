-----------------------------------------
-- Spell: Bind
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    --Pull base stats.
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));

    --Duration, including resistance.  May need more research.
    local duration = 60;

    --Resist
    local params = {};
    params.diff = nil;
    params.attribute = MOD_INT;
    params.skillType = 35;
    params.bonus = 0;
    params.effect = dsp.effects.BIND;
    local resist = applyResistanceEffect(caster, target, spell, params);

    if (resist >= 0.5) then --Do it!
        --Try to erase a weaker bind.
        if (target:addStatusEffect(dsp.effects.BIND,target:speed(),0,duration*resist)) then
            spell:setMsg(msgBasic.MAGIC_ENFEEB_IS);
        else
            spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
        end
    else
        spell:setMsg(msgBasic.MAGIC_RESIST);
    end

    return dsp.effects.BIND;

end;
