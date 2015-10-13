-----------------------------------
-- Area: Cloister of Tremors
-- NPC:  Titan Prime
-- Involved in Quest: Trial by Earth
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
	if (mob:getBattlefield():getBcnmID()==580 and GetMobAction(mobId) == ACTION_ATTACK) then
    		local astralFlows = mob:getLocalVar("astralflows");
	        local hpPercent = math.floor(mob:getHP() / mob:getMaxHP() * 100);
	        
	        if ((astralFlows==0 and hpPercent <= 80) or
	        (astralFlows==1 and hpPercent <= 60) or
	        (astralFlows==2 and hpPercent <= 40) or
	        (astralFlows==3 and hpPercent <= 20) or
	        (astralFlows==4 and hpPercent <= 1)) then	        	
	        	mob:useMobAbility(601);
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
	if (mob:getBattlefield():getBcnmID()==580) then
		mob:setLocalVar("astralflows","0");
		mob:setUnkillable(true);
	end
end;

-----------------------------------
-- OnMobDeath Action
-----------------------------------
function onMobDeath(mob, killer)
	if (mob:getBattlefield():getBcnmID()~=580) then
		killer:setVar("BCNM_Killed",1);
		record = 300;
		partyMembers = 6;
		pZone = killer:getZone();
	
		killer:startEvent(0x7d01,0,record,0,(os.time() - killer:getVar("BCNM_Timer")),partyMembers,0,0);
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("onUpdate CSID: %u",csid);
--printf("onUpdate RESULT: %u",option);
	
	if (csid == 0x7d01) then
		player:delStatusEffect(EFFECT_BATTLEFIELD);
	end
	
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("onFinish CSID: %u",csid);
--printf("onFinish RESULT: %u",option);
	
	if (csid == 0x7d01) then
		player:delKeyItem(TUNING_FORK_OF_EARTH);
		player:addKeyItem(WHISPER_OF_TREMORS);
		player:messageSpecial(KEYITEM_OBTAINED,WHISPER_OF_TREMORS);
	end
	
end;