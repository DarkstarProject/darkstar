-----------------------------------
-- Area: Cloister of Frost
-- NPC:  Shiva Prime
-- Involved in Quest: Trial by Ice
-- Involved in Mission: ASA-4 Sugar Coated Directive
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/status");

-----------------------------------
-- OnMobFight Action
-----------------------------------

function onMobFight(mob, target)
	local mobId = mob:getID();
    
    	-- ASA-4: Astral Flow Behavior - Guaranteed to Use At Least 5 times before killable, at specified intervals.
	if (mob:getBattlefield():getBcnmID()==484 and GetMobAction(mobId) == ACTION_ATTACK) then
    		local astralFlows = mob:getLocalVar("astralflows");
	        local hpPercent = math.floor(mob:getHP() / mob:getMaxHP() * 100);
	        
	        if ((astralFlows==0 and hpPercent <= 80) or
	        (astralFlows==1 and hpPercent <= 60) or
	        (astralFlows==2 and hpPercent <= 40) or
	        (astralFlows==3 and hpPercent <= 20) or
	        (astralFlows==4 and hpPercent <= 1)) then	        	
	        	mob:useMobAbility(628);
	        	astralFlows = astralFlows + 1;
	        	mob:setLocalVar("astralflows",astralFlows);
	        	
	        	if (astralFlows>=5) then
		       		mob:setUnkillable(false);
	        	end
	        end	    
	end
	
end;

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
	-- ASA-4: Avatar is Unkillable Until Its Used Astral Flow At Least 5 times At Specified Intervals
	if (mob:getBattlefield():getBcnmID()==484) then
		mob:setLocalVar("astralflows","0");
		mob:setUnkillable(true);
	end
end; 

-----------------------------------
-- OnMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)
end;