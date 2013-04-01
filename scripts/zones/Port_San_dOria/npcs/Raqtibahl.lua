-----------------------------------
-- Area: Port San d'Oria
-- NPC: Raqtibahl
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Port_San_dOria/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/keyitems");
require("scripts/globals/common");
require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

	if (FlyerForRegine == 1) then
		count = trade:getItemCount();
		MagicFlyer = trade:hasItemQty(532,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end
	
	-- "Corsair SideQuest" Trades
	
	if(player:getVar("LeleroonsLetterRed") ==2) then
		if(trade:getItemCount() == 4 and trade:hasItemQty(761,1) and trade:hasItemQty(828,1) and trade:hasItemQty(1829,1) and trade:hasItemQty(1997,1)) then -- Trade Gold Chain,Velvet Cloth,Red Grass Cloth,Sailcloth 
			player:tradeComplete(); --Trade Completed
			player:startEvent(0x2F3);
			player:setVar("LeleroonsLetterRed",3);
		end
	elseif(player:getVar("LeleroonsLetterRed") == 3) then
		if(trade:hasItemQty(2187,1) and trade:getItemCount() == 1) then -- Trade Imperial Gold Piece
			player:tradeComplete(); --Trade Completed
			player:startEvent(0x2F8);
			player:setVar("LeleroonsLetterRed",4);
			player:setVar("Corsair_Body_JPMidnight_Timer",getMidnight()); -- SET TIMER FOR 1 DAY REAL LIFE TIME
		end
	
	end	
	
	
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	-- Events Between "Corsair SideQuest"
	
	local RedLetter = player:getVar("LeleroonsLetterRed");
	
	if(RedLetter == 1 and player:hasKeyItem(LELEROONS_LETTER_RED) == true) then
		player:startEvent(0x2F1);
		player:delKeyItem(LELEROONS_LETTER_RED); -- Remove Key Item Red Letter
		player:setVar("LeleroonsLetterRed",2);
		player:setVar("AgainstAllOddsSideQuests",0);
	elseif(RedLetter ==2) then
		player:startEvent(0x2F2);
	elseif(RedLetter == 3) then
		player:startEvent(0x2F9);	
	elseif(player:getVar("Corsair_Body_JPMidnight_Timer") < os.time() and RedLetter == 4) then
		player:startEvent(0x2F4); -- CS For Final Part Of Side Quest Blue Letter Complete
	elseif(RedLetter == 4) then
		player:startEvent(0x2F5);	
	else
		player:startEvent(0x802f7); -- Standard Dialog
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
	if(csid == 0x2F4) then
		player:addItem(14522); --  Corsair's Frac
		player:messageSpecial(ITEM_OBTAINED,14522); -- Item Obtained: Corsair's Frac
		player:setVar("LeleroonsLetterRed",0);
		player:setVar("AgainstAllOddsSideQuests",1); -- Set for SideQuest NPC
		player:setVar("Corsair_Body_JPMidnight_Timer",0)
	end

end;




