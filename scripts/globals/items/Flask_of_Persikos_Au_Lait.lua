-----------------------------------
--	Author: Tenjou
-- 	Silent Oil
-- 	This gives the user the effect of sneak.
--
--	
-----------------------------------

require("scripts/globals/settings");
function OnUseItem(user,target,item)


--Do it!
user:addStatusEffect(EFFECT_REGEN,4,3,600,FLAG_DISPELABLE);

--Message/Animation
item:setAnimation(26);

	final = EFFECT_REGEN;
	return final;
end; 
 
 
 