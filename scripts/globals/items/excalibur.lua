-----------------------------------------
-- ID: 18276
-- Item: Excalibur
-- Additional Effect: Damage Propotional To player health (25% of health converted to damage)
-- weapon skill : knights_of_round
-----------------------------------------

require("scripts/globals/status");
require("Scripts/globals/bluemagic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local health = player:getHP();
	local params = {};
	local dmg = health / 4;
	
	params.dmgtype = DMGTYPE_SLASH;
    
    if (health <= 0) then
        return 0, 0, 0;
    end;

	local chance = math.random(1,10);
	chance = math.random(1,10);	
	if chance == 5 then
	    local msg = 163;
		damage = BlueFinalAdjustments(player,target, 0, dmg, DMGTYPE_SLASH);
    	return SUBEFFECT_LIGHT_DAMAGE, msg, damage;
    end;
	
	if chance ~= 5 then
		damage = 0;
	    return 0, 0, 0;		
    end;
end;