-----------------------------------
-- Area: Bastok Mines
-- NPC:  Abd-al-Raziq
-- Type: Alchemy Guild Master
-- @pos 126.768 1.017 -0.234 234
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
package.loaded["scripts/globals/crafting"] = nil;
require("scripts/globals/crafting");
require("scripts/zones/Bastok_Mines/TextIDs");

local SKILLID = 55; -- Alchemy

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	local newRank = tradeTestItem(player,npc,trade,SKILLID);
	
	if(newRank ~= 0) then
		player:setSkillRank(SKILLID,newRank);
		player:startEvent(0x0079,0,0,0,0,newRank);
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local getNewRank = 0;
	local craftSkill = player:getSkillLevel(SKILLID);
	local testItem = getTestItem(player,npc,SKILLID);
	local guildMember = isGuildMember(player,1);
	if(guildMember == 1) then guildMember = 150995375; end
	if(canGetNewRank(player,craftSkill,SKILLID) == 1) then getNewRank = 100; end
	
	player:startEvent(0x0078,testItem,getNewRank,30,guildMember,44,0,0,0);
	
end;

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
	
	if(csid == 0x0078 and option == 1) then
		signupGuild(player,2);
		
		local crystal = math.random(4096,4101);
		
		if(player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,crystal);
		else
			player:addItem(crystal);
			player:messageSpecial(ITEM_OBTAINED,crystal);
		end
	end
	
end;