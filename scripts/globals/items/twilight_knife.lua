-----------------------------------------
-- ID: 19132
-- Item: twilight knife
-- 
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------------
-- OnItemCheck
-----------------------------------------


function onAdditionalEffect(player,target,damage)
	local subeffect = 0;
	local dmg = math.random(5,25);
	local TYPE = math.random(1,3);
    local params = {};
    params.bonusmab = 0;
    params.includemab = false;
    dmg = addBonusesAbility(player, ELE_DARK, target, dmg, params);
    dmg = dmg * applyResistanceAddEffect(player,target,ELE_DARK,0);
    dmg = adjustForTarget(target,dmg,ELE_DARK);
    dmg = finalMagicNonSpellAdjustments(player,target,ELE_DARK,dmg);

    local message = 0;
	if (TYPE == 1) then
		message = 161;
		subeffect = SUBEFFECT_HP_DRAIN;
		player:addHP(dmg);
	elseif (TYPE == 2) then
		message = 162;
		subeffect = SUBEFFECT_MP_DRAIN;
		player:addMP(dmg);
	elseif (TYPE == 3) then
		message = 165;
		subeffect = SUBEFFECT_TP_DRAIN;
		player:addTP(dmg);
    elseif (dmg < 0) then
        message = 167;
    end

    return subeffect,message,dmg;
end;




