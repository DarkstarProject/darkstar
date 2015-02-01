-----------------------------------------
-- Spell: Meteor II
-- Deals non-elemental damage to an enemy.
-- MP Cost: 666
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	-- Calculate raw damage
	-- Byrthnoth @ Random Facts Thread: Magic @ BG:
	-- Spell Base Damage = MAB/MDB*floor(Int + Elemental Magic Skill/6)*3.5
	-- NOT AFFECTED BY DARK BONUSES (bonus ETC)
	-- I'll just point this out again. It can't resist, there's no dINT, and the damage is non-elemental. The only terms that affect it for monsters (that we know of) are MDB and MDT. If a --normal monster would take 50k damage from your group, Botulus would take 40k damage. Every. Time. 
	local dmg = ((100+caster:getMod(MOD_MATT))/(100+target:getMod(MOD_MDEF))) * (caster:getStat(MOD_INT) + (caster:getMod(79+ELEMENTAL_MAGIC_SKILL)+caster:getSkillLevel(ELEMENTAL_MAGIC_SKILL))/6) * 5.5;

	-- Add in target adjustment
	dmg = adjustForTarget(target,dmg,spell:getElement());
	-- Add in final adjustments
	dmg = finalMagicAdjustments(caster,target,spell,dmg);

	return dmg;
end;