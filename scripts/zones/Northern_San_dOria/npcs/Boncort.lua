-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Boncort
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) ==QUEST_ACCEPTED) then
	if (trade:hasItemQty(532,1) and trade:getItemCount() == 1 and player:getVar("tradeBoncort") == 0) then 
		player:messageSpecial(BONCORT_DIALOG);
		player:setVar("FFR",player:getVar("FFR") - 1);
		player:setVar("tradeBoncort",1);
		player:messageSpecial(FLYER_ACCEPTED);
                player:tradeComplete();
	elseif (player:getVar("tradeBoncort") ==1) then
		player:messageSpecial(FLYER_ALREADY);
	end
end
end;
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:showText(npc,BONCORT_SHOP_DIALOG);

	stock = {0x1159,837,1,	--Grape Juice 
			 0x1104,180,2,	--White Bread 
			 0x111c,198,2,	--Smoked Salmon
			 0x1147,270,2,	--Apple Juice 
			 0x110c,108,3,	--Black Bread 
			 0x1118,108,3,	--Meat Jerky 
			 0x119d,10,3,	--Distilled Water 
			 0x138F,163,3}	--Scroll of Sword Madrigal 

	showNationShop(player, SANDORIA, stock);
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
end;




