-----------------------------------------
-- ID: 18153
-- Item: Holy Bolt
-- Additional Effect: Light Damage
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)
    local chance = 105;
    if (target:getMainLvl() > player:getMainLvl()) then
        chance = chance - 5 * (target:getMainLvl() - player:getMainLvl())
        chance = utils.clamp(chance, 5, 95);
    end
    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local diff = player:getStat(MOD_MND) - target:getStat(MOD_MND);
		if (diff < 20) then
            diff = diff+(diff-20)/2;
        end
        local dmg = diff + (player:getMainLvl() - target:getMainLvl());
        local params = {};
        params.bonusmab = 0;
        params.includemab = true;
        dmg = addBonusesAbility(player, ELE_LIGHT, target, dmg, params);
        dmg = adjustForTarget(target,dmg,ELE_LIGHT);
     		
		-- Gear Adjustments
		local main = player:getEquipID(SLOT_MAIN);
		if (main == 18633 or main == 17558) then -- Apollo's staff / Chatoyant staff
			dmg=dmg*1.2;
		end
		if (main == 17557) then
			dmg=dmg*1.1;
		end
		if (main == 17559) then
			dmg=dmg*0.9;
		end
		if (main == 17560) then
			dmg=dmg*0.8;
		end
		
		dmg = finalMagicNonSpellAdjustments(player,target,ELE_LIGHT,dmg);
        return SUBEFFECT_LIGHT_DAMAGE, 163, dmg;
    end
end;