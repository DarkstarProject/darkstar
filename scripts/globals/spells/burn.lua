-----------------------------------------
-- Spell: Burn
-- Deals fire damage that lowers an enemy's intelligence and gradually reduces its HP.
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    
    if (target:getStatusEffect(EFFECT_DROWN) ~= nil) then
        spell:setMsg(75); -- no effect
    else        
        local dINT = caster:getStat(MOD_INT)-target:getStat(MOD_INT);
        local resist = applyResistance(caster,spell,target,dINT,36,0);
        if (resist <= 0.125) then
            spell:setMsg(85);
        else
            if (target:getStatusEffect(EFFECT_FROST) ~= nil) then
                target:delStatusEffect(EFFECT_FROST);
            end;
            local sINT = caster:getStat(MOD_INT);
            local DOT = getElementalDebuffDOT(sINT);
            local effect = target:getStatusEffect(EFFECT_BURN);
            local noeffect = false;
            if (effect ~= nil) then
                if (effect:getPower() >= DOT) then
                    noeffect = true;
                end;
            end;
            if (noeffect) then
                spell:setMsg(75); -- no effect
            else
                if (effect ~= nil) then
                    target:delStatusEffect(EFFECT_BURN);
                end;
                spell:setMsg(237);
                local duration = math.floor(ELEMENTAL_DEBUFF_DURATION * resist);
                target:addStatusEffect(EFFECT_BURN,DOT, 3, ELEMENTAL_DEBUFF_DURATION,FLAG_ERASABLE);
            end;
        end;
    end;
    
    return EFFECT_BURN;
    
end;