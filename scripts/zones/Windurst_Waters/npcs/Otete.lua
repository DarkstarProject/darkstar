-----------------------------------
--	Area: Windurst_Waters
--	NPC: Otete
--	Only sells when Windurst controlls Li'Telor Region
--	Working 100%
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
require("scripts/zones/Windurst_Waters/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

RegionOwner = getRegionOwner(LITELOR);

if (RegionOwner ~= WINDURST) then 
	player:showText(npc,OTETE_CLOSED_DIALOG);
else
	player:showText(npc,OTETE_OPEN_DIALOG);
	
	stock = {0x026f,119,  --Bay Leaves
			 0x103a,6440} --Holy Water
			  
showShop(player,WINDURST,stock);
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