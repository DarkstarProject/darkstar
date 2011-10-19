-----------------------------------
--	Area: Southern San d'Oria
--	NPC: Phamelise
--	Only sells when San d'Oria controlls Zulkheim Region
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
package.loaded["scripts/globals/quests"] = nil;
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

RegionOwner = getRegionOwner(ZULKHEIM);

if (RegionOwner ~= SANDORIA) then 
	player:showText(npc,PHAMELISE_CLOSED_DIALOG);
else
	player:showText(npc,PHAMELISE_OPEN_DIALOG);
	
	stock = {0x1114,44,	  --Giant Sheep Meat
			 0x026e,44,	  --Dried Marjoram
			 0x0262,55,	  --San d'Orian Flour
			 0x0263,36,	  --Rye Flour
			 0x0730,1840, --Semolina
			 0x110e,22,	  --La Theine Cabbage
			 0x111a,55}	  --Selbina Milk

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




