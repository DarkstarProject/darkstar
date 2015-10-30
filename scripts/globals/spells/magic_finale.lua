
require("scripts/globals/magic");
require("scripts/globals/status");
-----------------------------------------
-- Spell: Magic Finale
--
-----------------------------------------

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
    -- Pull base stats.
    local dINT = (caster:getStat(MOD_CHR) - target:getStat(MOD_CHR));

    local resist = applyResistance(caster,spell,target,dINT,SINGING_SKILL,caster:getMod(MOD_FINALE_EFFECT) + caster:getMod(MOD_ALL_SONGS_EFFECT));
    local effect = EFFECT_NONE;

    if (resist > 0.0625) then
        spell:setMsg(341);
        effect = target:dispelStatusEffect();
        if (effect == EFFECT_NONE) then
            -- no effect
            spell:setMsg(75);
        end
    else
        spell:setMsg(85);
    end

    return effect;
end;
