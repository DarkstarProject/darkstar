-----------------------------------
-- Area: Northern San d'Oria
-- NPC: Gaudylox
-- Standard Merchant NPC
-----------------------------------

require("scripts/globals/shop");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

	if (FlyerForRegine == 1) then
		count = trade:getItemCount();
		MagicFlyer = trade:hasItemQty(MagicmartFlyer,1);
		if (MagicFlyer == true and count == 1) then
			player:messageSpecial(FLYER_REFUSED);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
player:showText(npc,GAUDYLOX_SHOP_DIALOG);

stock = {0x01e1,21000,		-- Black Chip
	 0x01db,21000,		-- Blue Chip
	 0x01de,21000,		-- Clear Chip
	 0x01dd,21000,		-- Green Chip
	 0x01de,21000,		-- Purple Chip
	 0x01da,21000,		-- Red Chip
	 0x01e0,21000,		-- White Chip
	 0x01dc,21000}		-- Yellow Chip
 
showShop(player, STATIC, stock);
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