-----------------------------------------
-- Spell: Meteor
-- Deals non-elemental damage to an enemy.
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");
-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
   -- TODO: Correct message is "Incorrect job, job level too low, or required ability not activated."  Unable to locate this in our basic or system message functions.
   -- The client blocks the spell via menus, but it can still be cast via text commands, so we have to block it here, albiet with the wrong message.
    if (caster:isMob()) then
        return 0;
    elseif (caster:hasStatusEffect(EFFECT_ELEMENTAL_SEAL) == true) then
        return 0;
    else
        return MSGBASIC_STATUS_PREVENTS;
    end
end;

function onSpellCast(caster,target,spell)

	--calculate raw damage
	--Byrthnoth @ Random Facts Thread: Magic @ BG:
	--Spell Base Damage = MAB/MDB*floor(Int + Elemental Magic Skill/6)*3.5
	--NOT AFFECTED BY DARK BONUSES (bonus ETC)
	--I'll just point this out again. It can't resist, there's no dINT, and the damage is non-elemental. The only terms that affect it for monsters (that we know of) are MDB and MDT. If a --normal monster would take 50k damage from your group, Botulus would take 40k damage. Every. Time. 
    local dmg = 0;
	if (caster:isPC()) then
        dmg = ((100+caster:getMod(MOD_MATT))/(100+target:getMod(MOD_MDEF))) * (caster:getStat(MOD_INT) + (caster:getMod(79+ELEMENTAL_MAGIC_SKILL)+caster:getSkillLevel(ELEMENTAL_MAGIC_SKILL))/6) * 3.5;
	else
        dmg = ((100+caster:getMod(MOD_MATT))/(100+target:getMod(MOD_MDEF))) * (caster:getStat(MOD_INT) + (caster:getMaxSkillLevel(caster:getMainLvl(), JOB_BLM, ELEMENTAL_MAGIC_SKILL))/6) * 9.4;
    end

	--add in target adjustment
	dmg = adjustForTarget(target,dmg,spell:getElement());
	--add in final adjustments
	dmg = finalMagicAdjustments(caster,target,spell,dmg);
	return dmg;
	
end;