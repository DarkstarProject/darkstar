-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Faulpie
-- Type: Leathercraft Guild Master
-- @pos -178.882 -2 9.891 230
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/crafting");
require("scripts/zones/Southern_San_dOria/TextIDs");

local SKILLID = 53; -- Leathercraft

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	local newRank = tradeTestItem(player,npc,trade,SKILLID);
	
	if(newRank ~= 0) then
		player:setSkillRank(SKILLID,newRank);
		player:startEvent(0x0289,0,0,0,0,newRank);
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local getNewRank = 0;
	local craftSkill = player:getSkillLevel(SKILLID);
	local testItem = getTestItem(player,npc,SKILLID);
	local guildMember = isGuildMember(player,7);
	if(guildMember == 1) then guildMember = 150995375; end
	if(canGetNewRank(player,craftSkill,SKILLID) == 1) then getNewRank = 100; end
	
	if (player:getCurrentMission(ASA) == THAT_WHICH_CURDLES_BLOOD and guildMember == 150995375 and 
		getNewRank ~= 100) then
			local item = 0;
			local asaStatus = player:getVar("ASA_Status");
					
			-- TODO: Other Enfeebling Kits
			if(asaStatus == 0) then
				item = 2779;
			else
				printf("Error: Unknown ASA Status Encountered <%u>", asaStatus);
			end
	
			-- The Parameters are Item IDs for the Recipe		
			player:startEvent(0x03b0, item, 2773, 917, 917, 2776, 4103);		
	else
		player:startEvent(0x0288,testItem,getNewRank,30,guildMember,44,0,0,0);
	end	
end;

-- 0x0288  0x0289  0x02f8  0x02f9  0x02fa  0x02fb  0x02fc  0x02fd  0x0302  0x0303  0x0304  0x0305  0x0306  0x0307  0x03b0  0x0392

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
	
	if(csid == 0x0288 and option == 1) then
		local crystal = math.random(4096,4101);
		
		if(player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,crystal);
		else
			player:addItem(crystal);
			player:messageSpecial(ITEM_OBTAINED,crystal);
			signupGuild(player, SKILL_LTH);
		end
	end
	
end;