-----------------------------------------
-- Spell: Bind
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

    --Pull base stats.
    local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));

    --Duration, including resistance.  May need more research.
    local duration = 60;

    if (caster:hasStatusEffect(EFFECT_SABOTEUR)) then
        duration = duration * 2;
    end
    caster:delStatusEffect(EFFECT_SABOTEUR);

    --Resist
    local resist = applyResistanceEffect(caster,spell,target,dINT,35,0,EFFECT_BIND);

    if (resist >= 0.5) then --Do it!
        --Try to erase a weaker bind.
        if (target:addStatusEffect(EFFECT_BIND,target:speed(),0,duration*resist)) then
            spell:setMsg(236);
        else
            spell:setMsg(75);
        end
    else
        spell:setMsg(85);
    end

    return EFFECT_BIND;

end;