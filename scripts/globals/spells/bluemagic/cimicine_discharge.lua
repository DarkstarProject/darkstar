-----------------------------------------
-- Spell: Cimicine Discharge
-- Reduces the attack speed of enemies within range
-- Spell cost: 32 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Earth)
-- Blue Magic Points: 3
-- Stat Bonus: DEX+1, AGI+2
-- Level: 78
-- Casting Time: 3 seconds
-- Recast Time: 20 seconds
--
-- Combos: Magic Burst Bonus
-----------------------------------------
require("scripts/globals/bluemagic");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local duration = math.random(60,180);
    local pINT = caster:getStat(MOD_INT);
    local mINT = target:getStat(MOD_INT);
    local dINT = (pINT - mINT);
    local params = {};
    params.diff = nil;
    params.attribute = MOD_INT;
    params.skillType = BLUE_SKILL;
    params.bonus = 0;
    params.effect = nil;
    local resist = applyResistance(caster, target, spell, params);

    if (resist < 0.5) then
        spell:setMsg(msgBasic.MAGIC_RESIST); --resist message
        return dsp.effects.SLOW;
    end

    if (target:addStatusEffect(dsp.effects.SLOW,200,0,getBlueEffectDuration(caster,resist,dsp.effects.SLOW))) then
        spell:setMsg(msgBasic.MAGIC_ENFEEB_IS);
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    end

    return dsp.effects.SLOW;
end;
