-----------------------------------
--	Area: Southern San d'Oria
--	NPC: Pourette
--	Only sells when San d'Oria controlls Derfland Region
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
require("scripts/globals/quests");
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
require("scripts/zones/Southern_San_dOria/TextIDs");

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

RegionOwner = getRegionOwner(DERFLAND);

if (RegionOwner ~= SANDORIA) then 
	player:showText(npc,POURETTE_CLOSED_DIALOG);
else
	player:showText(npc,POURETTE_OPEN_DIALOG);
	
	stock = {0x1100,128,  --Derfland Pear
			 0x0269,142,  --Ginger
			 0x11c1,62,	  --Gysahl Greens
			 0x0584,1656, --Olive Flower
			 0x0279,14,	  --Olive Oil
			 0x03b7,110}  --Wijnruit

showShop(player,SANDORIA,stock);
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
end;



