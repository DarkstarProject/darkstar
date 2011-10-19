-----------------------------------
--	Area: Port San d'Oria
--	NPC:  Milva
-- 	Only sells when San d'Oria has control of Sarutabaruta
-----------------------------------

require("scripts/globals/shop");
require("scripts/globals/conquest");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
require("scripts/zones/Port_San_dOria/TextIDs");

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

RegionOwner = getRegionOwner(SARUTABARUTA);

if (RegionOwner ~= SANDORIA) then 
	player:showText(npc,MILVA_CLOSED_DIALOG);
else
	player:showText(npc,MILVA_OPEN_DIALOG);
	
	stock = {0x115c,22, --Rarab Tail
			 0x02b1,33, --Lauan Log
			 0x026b,43, --Popoto
			 0x1128,29, --Saruta Orange
			 0x027b,18} --Windurstian Tea Leaves
	
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




