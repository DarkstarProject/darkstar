-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Cahaurme
-- Involved in Quest: A Knight's Test, Lost Chick
-- @zone 230
-- @pos 55.749 -8.601 -29.354
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

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
end;

----------------------------------- 
-- onTrigger Action 
-----------------------------------
 
function onTrigger(player,npc)

	if (player:hasKeyItem(BOOK_OF_TASKS) and player:hasKeyItem(BOOK_OF_THE_EAST) == false) then
		player:startEvent(0x0279);
	else
		player:showText(npc, 7817); -- nothing to report
	
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

	if (csid == 0x0279) then
		player:addKeyItem(BOOK_OF_THE_EAST);
		player:messageSpecial(KEYITEM_OBTAINED, BOOK_OF_THE_EAST);
	end
	
end;
--- for future use
	-- player:startEvent(0x034f) --are you the chicks owner