-----------------------------------
-- Area: Bastok Markets
-- NPC:  Reinberta
-- Type: Goldsmithing Guild Master
-- @pos -190.605 -7.814 -59.432 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/crafting");
require("scripts/zones/Bastok_Markets/TextIDs");

local SKILLID = 51; -- Goldsmithing

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	local newRank = tradeTestItem(player,npc,trade,SKILLID);
	
	if(newRank ~= 0) then
		player:setSkillRank(SKILLID,newRank);
		player:startEvent(0x012d,0,0,0,0,newRank);
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local getNewRank = 0;
	local craftSkill = player:getSkillLevel(SKILLID);
	local testItem = getTestItem(player,npc,SKILLID);
	local guildMember = isGuildMember(player,6);
	if(guildMember == 1) then guildMember = 150995375; end
	if(canGetNewRank(player,craftSkill,SKILLID) == 1) then getNewRank = 100; end
	
	player:startEvent(0x012c,testItem,getNewRank,30,guildMember,44,0,0,0);
	
end;

-- 0x012c  0x012d  0x0192

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
	
	if(csid == 0x012c and option == 1) then	
		local crystal = math.random(4096,4101);
		
		if(player:getFreeSlotsCount() == 0) then 
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,crystal);
		else
			player:addItem(crystal);
			player:messageSpecial(ITEM_OBTAINED,crystal);
			signupGuild(player, SKILL_GLD);
		end
	end
	
end;