-----------------------------------
--  Area: Aht Urhgan Whitegate
--  NPC: Tehf Kimasnahya
--  Type: Standard NPC
--  @pos -89.897 -1 6.199 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	local gotitall = player:getQuestStatus(AHT_URHGAN,GOT_IT_ALL);
	local gotItAllProg = player:getVar("gotitallCS");
	local threeMenProg = player:getVar("threemenandaclosetCS");
    if (gotitall == QUEST_AVAILABLE) then
		player:startEvent(0x0208);
	elseif (gotItAllProg == 4) then
	    player:startEvent(0x020d);
    elseif (gotItAllProg == 6) then
	    player:startEvent(0x020f);
	elseif (gotItAllProg >= 7 and player:getVar("Wait1DayForgotitallCS_date") < os.time() and player:needToZone() == false) then
	    player:startEvent(0x0210);
	elseif (gotItAllProg >= 7) then
	    player:startEvent(0x021b);
	elseif (gotItAllProg >= 1 and gotItAllProg <= 3) then
		player:startEvent(0x0209);
	elseif (threeMenProg == 5) then
	    player:startEvent(0x034b);
	elseif (threeMenProg == 6) then
	    player:startEvent(0x034c);
	else
	    player:startEvent(0x0211);
	end
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
	if (csid == 0x0208) then
	   player:addQuest(AHT_URHGAN,GOT_IT_ALL);
	   player:setVar("gotitallCS",1);
	elseif (csid == 0x020d and option == 0) then
	   player:setVar("gotitallCS",5);
	   player:delKeyItem(VIAL_OF_LUMINOUS_WATER);
	elseif (csid == 0x020f) then
	   player:setVar("gotitallCS",7);
	   player:setVar("Wait1DayForgotitallCS_date", getMidnight());
	   player:needToZone(true);
	elseif (csid == 0x021b) then
	   player:setVar("gotitallCS",8);
	   
	elseif (csid == 0x0210) then
	    if (player:getFreeSlotsCount() == 0) then
		   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,18257);
	    else
		   player:setVar("Wait1DayForgotitallCS_date",0);
	       player:setVar("gotitallCS",0);
	       player:addItem(18257); -- Bibiki Seashell
		   player:messageSpecial(ITEM_OBTAINED,18257);
		   player:completeQuest(AHT_URHGAN,GOT_IT_ALL);
        end	
	elseif (csid == 0x034b and option == 1) then
	    player:setVar("threemenandaclosetCS",6);	
	end
end;

