-----------------------------------------
-- Spell: Meteor
-- Deals non-elemental damage to an enemy.
-----------------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
	--calculate raw damage
	--Byrthnoth @ Random Facts Thread: Magic @ BG:
	--Spell Base Damage = MAB/MDB*floor(Int + Elemental Magic Skill/6)*3.5
	--NOT AFFECTED BY DARK BONUSES (bonus ETC)
	--I'll just point this out again. It can't resist, there's no dINT, and the damage is non-elemental. The only terms that affect it for monsters (that we know of) are MDB and MDT. If a --normal monster would take 50k damage from your group, Botulus would take 40k damage. Every. Time. 
	dmg = ((100+caster:getMod(MOD_MATT))/(100+target:getMod(MOD_MDEF))) * (caster:getStat(MOD_INT) + (caster:getMod(79+ELEMENTAL_MAGIC_SKILL)+caster:getSkillLevel(ELEMENTAL_MAGIC_SKILL))/6) * 3.5;
	
	--add in target adjustment
	dmg = adjustForTarget(target,dmg);
	--add in final adjustments
	dmg = finalMagicAdjustments(caster,target,spell,dmg);

	return dmg;
end;