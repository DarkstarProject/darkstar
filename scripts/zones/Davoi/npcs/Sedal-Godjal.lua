-----------------------------------
-- Area: Davoi
-- NPC:  Sedal-Godjal
-- Mini Quest used in : Whence Blows the Wind
-- @zone 149
-- @pos 185 -2 -116
-----------------------------------
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/Davoi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:hasKeyItem(CRIMSON_ORB) == false) then
		
		miniQuestForORB_CS = player:getVar("miniQuestForORB_CS");
		countRedPoolForORB = player:getVar("countRedPoolForORB");
		
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
	end

end;