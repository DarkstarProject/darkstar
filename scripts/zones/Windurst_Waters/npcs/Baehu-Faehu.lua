-----------------------------------
--	Area: Windurst Waters
--	NPC:  Baehu-Faehu
-- 	Only sells when Windurst has control of Sarutabaruta
--	Working 100%
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
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

RegionOwner = GetRegionOwner(SARUTABARUTA);

if (RegionOwner ~= WINDURST) then 
	player:showText(npc,BAEHUFAEHU_CLOSED_DIALOG);
else
	player:showText(npc,BAEHUFAEHU_OPEN_DIALOG);
	
	stock = {0x115c,22, --Rarab Tail
			 0x02b1,33, --Lauan Log
			 0x026b,43, --Popoto
			 0x1128,29, --Saruta Orange
			 0x027b,18} --Windurstian Tea Leaves
	
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



