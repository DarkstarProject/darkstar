-----------------------------------
--	Area: Southern San d'Oria
--	NPC: Hae Jakhya
--  General Info NPC
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
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
	
	chasingStatus = player:getQuestStatus(WINDURST,CHASING_TALES);
	
	if (player:getVar("CHASING_TALES_TRACK_BOOK") == 1 and player:hasKeyItem(126) == false) then
	    player:startEvent(0x0263); -- Neeed CS here
	elseif (player:hasKeyItem(126) == true) then
		player:startEvent(0x0264,0,126);
	else
		player:startEvent(0x262);
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
    if (csid == 0x0263) then
        player:addKeyItem(126);
	player:messageSpecial(KEYITEM_OBTAINED,126);
    end		
end;
