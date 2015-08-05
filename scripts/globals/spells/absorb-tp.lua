--------------------------------------
--  Spell: Absorb-TP
--  Steals an enemy's TP.
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

	local dmg = math.random();
	dmg = math.random();
    dmg = math.random(10, 80);
    --get resist multiplier (1x if no resist)
    local resist = applyResistance(caster,spell,target,caster:getStat(MOD_INT)-target:getStat(MOD_INT),DARK_MAGIC_SKILL,1.0);
    --get the resisted damage
    dmg = dmg*resist;
    --add on bonuses (staff/day/weather/jas/mab/etc all go in this function)
    dmg = addBonuses(caster,spell,target,dmg);
    --add in target adjustment
    dmg = adjustForTarget(target,dmg,spell:getElement());
    --add in final adjustments

    local cap = 120;
    if (dmg > cap) then
        dmg = cap;
    end

    if (resist <= 0.125) then
        spell:setMsg(85);
    else
        spell:setMsg(454);

        if (target:getTP() < dmg) then
            dmg = target:getTP();
        end

        -- drain
        caster:addTP(dmg*(100+(caster:getMod(MOD_AUGMENTS_ABSORB)))/100);
        target:addTP(-dmg*(100+(caster:getMod(MOD_AUGMENTS_ABSORB)))/100);

    end
    return dmg;
end;