-----------------------------------
-- Area: Davoi
-- NPC:  Sedal-Godjal
-- Mini Quest used in : Whence Blows the Wind
-- @pos 185 -2 -116 149
-----------------------------------
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Davoi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

	local CurrentMission = player:getCurrentMission(WINDURST);
	local MissionStatus = player:getVar("MissionStatus");

	if(trade:hasItemQty(17437,1)) then
		if(CurrentMission == VAIN and MissionStatus == 3 and player:hasKeyItem(MAGIC_DRAINED_STAR_SEEKER) == true) then
			player:startEvent(0x0078);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	local CurrentMission = player:getCurrentMission(WINDURST);
	local MissionStatus = player:getVar("MissionStatus");

	if(CurrentMission == VAIN and MissionStatus >= 2) then -- wiki says it doesnt matter whether you get cs or kill first
		if(player:hasKeyItem(STAR_SEEKER) == true) then
			player:startEvent(0x0076,0,17437,STAR_SEEKER);
		elseif(player:hasKeyItem(MAGIC_DRAINED_STAR_SEEKER) and MissionStatus == 4) then
			player:startEvent(0x0079);
		else
			player:startEvent(0x0077,0,17437);
		end
		
	elseif(player:hasKeyItem(CRIMSON_ORB) == false) then
		
		local miniQuestForORB_CS = player:getVar("miniQuestForORB_CS");
		local countRedPoolForORB = player:getVar("countRedPoolForORB");
		
		if(miniQuestForORB_CS == 0) then 
			player:startEvent(0x0018); -- 
		elseif(miniQuestForORB_CS == 99) then 
			player:startEvent(0x0016); -- Start mini quest
		elseif(miniQuestForORB_CS == 1 and countRedPoolForORB ~= 15) then 
			player:startEvent(0x0015); -- During mini quest
		elseif(miniQuestForORB_CS == 1 and countRedPoolForORB == 15) then 
			player:startEvent(0x0019,0,0,0,CRIMSON_ORB); -- Finish mini quest
		end
	else
		player:startEvent(0x0018); -- Standard dialog
	end
	
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

	if(csid == 0x0016 and option == 1) then
		player:setVar("miniQuestForORB_CS",1);
		player:addKeyItem(WHITE_ORB);
		player:messageSpecial(KEYITEM_OBTAINED, WHITE_ORB);
	elseif(csid == 0x0019) then 
		player:setVar("miniQuestForORB_CS",0);
		player:setVar("countRedPoolForORB",0);
		player:delKeyItem(CURSED_ORB);
		player:addKeyItem(CRIMSON_ORB);
		player:messageSpecial(KEYITEM_OBTAINED, CRIMSON_ORB);
	elseif(csid == 0x0076) then
		player:delKeyItem(STAR_SEEKER);
		player:addKeyItem(MAGIC_DRAINED_STAR_SEEKER);
		player:setVar("MissionStatus",3);
	elseif(csid == 0x0078) then
		player:tradeComplete();
		player:setVar("MissionStatus",4);
	end

end;
