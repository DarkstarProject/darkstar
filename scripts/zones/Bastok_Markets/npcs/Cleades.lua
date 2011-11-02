-----------------------------------
-- Area: Bastok Markets
-- NPC: Cleades
-- Starts: Bastok Misions
-----------------------------------

package.loaded["scripts/globals/rankpoints"] = nil;
require("scripts/globals/rankpoints");
require("scripts/globals/settings");
package.loaded["scripts/globals/missions"] = nil;
require("scripts/globals/missions");
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if (player:getCurrentMission(1) == 2 or player:getVar("MissionRepeatable") == 2) then
		count = trade:getItemCount();
		gil = trade:getGil();
		fetichItems = (trade:hasItemQty(FETICH_HEAD,1)) and (trade:hasItemQty(FETICH_TORSO,1)) and (trade:hasItemQty(FETICH_ARMS,1)) and (trade:hasItemQty(FETICH_LEGS,1))
		if (fetichItems and count == 4 and gil == 0) then

			if (player:getRank() == 1) then
				player:startEvent(0x03f0);
			else
				if (player:hasCompletedMission(1,2) == 1) then
					player:startEvent(0x03ED);
				else
					player:setVar("Fetichism_Complete",1);
					player:startEvent(0x03F1);
				end
			end
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:getNation() ~= 1) then
		player:startEvent(0x03EB);
	else
		currentMission = player:getCurrentMission(1);
		pRank = player:getRank();
		missionRepeatable = player:getVar("MissionRepeatable");

		if (missionRepeatable ~= 0) then
			delta = getMissionOffset(player,missionRepeatable);
		else
			delta = getMissionOffset(player,currentMission);
		end

		if (missionActive == true and currentMission <= 15 or missionRepeatable ~= 0) then
			player:showText(npc,ORIGINAL_MISSION_OFFSET+delta);
		elseif (missionActive == true and currentMission > 15 and currentMission ~= 255) then
			player:showText(npc,ZILART_MISSION_OFFSET+delta);
		elseif (pRank == 1 and player:hasCompletedMission(1,0) == 0) then
			player:startEvent(0x03E8);
  		elseif (pRank == 5) and (player:hasKeyItem(MESSAGE_TO_JEUNO_BASTOK) == 1) then
    		player:startEvent(0x03EF);
		elseif (player:hasKeyItem(LETTER_FROM_WEREI) == 1) then
			player:startEvent(0x03F3);
		elseif (player:hasCurrentMission(1) == true) then
			player:startEvent(0x03EA);
		else
		 	flagMission, repeatMission = getMissionMask(player);
		 	player:startEvent(0x03E9,flagMission,0,0,0,0,repeatMission);
		end
	end
end;

---------------------------------------------
-- Returns Current Mission offset
---------------------------------------------
function getMissionOffset(player,pMission)
	offset = 0;
	switch (pMission) : caseof {
		[0] = function (x) offset = 0; end,
		[1] = function (x) offset = 3; end,
		[2] = function (x) offset = 6; end,
		[3] = function (x) offset = 19; end,
		[4] = function (x) offset = 21; end,
		[5] = function (x) offset = 23; end,
		[10] = function (x) offset = 27; end,
		[11] = function (x) offset = 30; end,
		[12] = function (x) offset = 35; end,
		[14] = function (x) offset = 37; end,
		[15] = function (x) offset = 39; end,
		[16] = function (x) offset = 0; end,
		[17] = function (x) offset = 3; end,
		[18] = function (x) offset = 5; end,
		[19] = function (x) offset = 7; end,
		[20] = function (x) offset = 10; end,
		[21] = function (x) offset = 12; end,
		[22] = function (x) offset = 14; end,
		[23] = function (x) offset = 19; end,
	default = function (x) end, }
	return offset;
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

	if (csid == 0x03E8) and (option == 0) then
		player:addMission(BASTOK,THE_ZERUHN_REPORT);
	elseif (csid == 0x03E9) and (option ~= 31) and (option ~= 1073741824) then
		fetichism = ((option == 2) and (player:hasCompletedMission(1,2) == 1))
		wadingBeasts =  ((option == 4) and (player:hasCompletedMission(1,4) == 1))
		forsakenMines = ((option ==11) and (player:hasCompletedMission(1,11) == 1))

		if ( fetichism or wadingBeasts or forsakenMines) then
			player:setVar("MissionRepeatable",option);
		else
			player:addMission(BASTOK, option);
		end
	elseif (csid == 0x03EC) or (csid == 0x03F0) then
		player:completeMission(1);
		player:tradeComplete();																							  -- Fetichism first completion
		player:addGil(GIL_RATE*1000);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*1000);
		player:setRank(2);
	elseif (csid == 0x03ED) then
		player:tradeComplete();																							  -- Fetichism first completion
		player:addGil(GIL_RATE*1000);
		player:messageSpecial(GIL_OBTAINED,GIL_RATE*1000);
		player:setVar("MissionRepeatable",0);
	end
end;
