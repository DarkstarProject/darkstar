-----------------------------------
-- Area: The Shrine of Ru'Avitau
-- NPC:  ??? divine might mission
-----------------------------------
package.loaded["scripts/zones/The_Shrine_of_RuAvitau/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/The_Shrine_of_RuAvitau/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if(player:getCurrentMission(ZILART) == ARK_ANGELS and player:getVar("DivineMight") == 0) then				-- Start divine might
		player:startEvent(0x0035,917,1408,1550);
	elseif(player:hasCompletedMission(ZILART,ARK_ANGELS) == true and player:getVar("DivineMight") == 0) then	-- Player wants to repeat Divine might
		player:startEvent(0x0035,917,1408,1550);
	elseif(player:getCurrentMission(ZILART) == ARK_ANGELS and player:getVar("DivineMight") == 1) then			-- CS during Divine might
		player:startEvent(0x0036,917,1408,1550);
	elseif(player:getCurrentMission(ZILART) == ARK_ANGELS and player:getVar("DivineMight") == 2) then			-- CS when player has completed Divine might
		player:startEvent(0x0037,14739,14740,14741,14742,14743);	
	end
	
	return cs;
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if(csid == 0x0035) then
		player:setVar("DivineMight",1);

	elseif(csid == 0x0037 and option ~= 0) then
		if(player:getFreeSlotsCount() >= 1) then
			player:addItem(14739);
			player:messageSpecial(ITEM_OBTAINED,14739);
			player:setVar("DivineMight",0);
				if(player:getCurrentMission(ZILART) == ARK_ANGELS) then
					player:completeMission(ZILART,ARK_ANGELS);
					player:addMission(ZILART,THE_SEALED_SHRINE);
				end
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,inventory[Item + 2]);
		end
	elseif(csid == 0x0037 and option ~= 1) then
		if(player:getFreeSlotsCount() >= 1) then
			player:addItem(14740);
			player:messageSpecial(ITEM_OBTAINED,14739);
			player:setVar("DivineMight",0);
				if(player:getCurrentMission(ZILART) == ARK_ANGELS) then
					player:completeMission(ZILART,ARK_ANGELS);
					player:addMission(ZILART,THE_SEALED_SHRINE);
				end
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,inventory[Item + 2]);
		end;
	elseif(csid == 0x0037 and option ~= 2) then
		if(player:getFreeSlotsCount() >= 1) then
			player:addItem(14741);
			player:messageSpecial(ITEM_OBTAINED,14739);
			player:setVar("DivineMight",0);
				if(player:getCurrentMission(ZILART) == ARK_ANGELS) then
					player:completeMission(ZILART,ARK_ANGELS);
					player:addMission(ZILART,THE_SEALED_SHRINE);
				end
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,inventory[Item + 2]);
		end;
	elseif(csid == 0x0037 and option ~= 3) then
		if(player:getFreeSlotsCount() >= 1) then
			player:addItem(14742);
			player:messageSpecial(ITEM_OBTAINED,14739);
			player:setVar("DivineMight",0);
				if(player:getCurrentMission(ZILART) == ARK_ANGELS) then
					player:completeMission(ZILART,ARK_ANGELS);
					player:addMission(ZILART,THE_SEALED_SHRINE);
				end
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,inventory[Item + 2]);
		end;
	elseif(csid == 0x0037 and option ~= 4) then
		if(player:getFreeSlotsCount() >= 1) then
			player:addItem(14743);
			player:messageSpecial(ITEM_OBTAINED,14739);
			player:setVar("DivineMight",0);
				if(player:getCurrentMission(ZILART) == ARK_ANGELS) then
					player:completeMission(ZILART,ARK_ANGELS);
					player:addMission(ZILART,THE_SEALED_SHRINE);
				end
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,inventory[Item + 2]);
		end
	end





	
end;