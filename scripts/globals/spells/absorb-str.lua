--------------------------------------
--     Spell: Absorb-STR
--     Steals an enemy's strength.
--------------------------------------
 
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
    
    if (target:hasStatusEffect(EFFECT_STR_DOWN) or caster:hasStatusEffect(EFFECT_STR_BOOST)) then
        spell:setMsg(75); -- no effect
    else        
        local dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
        local resist = applyResistance(caster,spell,target,dINT,37,0);
        if (resist <= 0.125) then
            spell:setMsg(85);
        else
            spell:setMsg(329);
            caster:addStatusEffect(EFFECT_STR_BOOST,ABSORB_SPELL_AMOUNT*resist*((100+(caster:getMod(MOD_AUGMENTS_ABSORB)))/100), ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK,FLAG_DISPELABLE); -- caster gains STR
            target:addStatusEffect(EFFECT_STR_DOWN,ABSORB_SPELL_AMOUNT*resist*((100+(caster:getMod(MOD_AUGMENTS_ABSORB)))/100), ABSORB_SPELL_TICK, ABSORB_SPELL_AMOUNT*ABSORB_SPELL_TICK,FLAG_ERASABLE);    -- target loses STR
        end
    end
    return EFFECT_STR_DOWN;
end;