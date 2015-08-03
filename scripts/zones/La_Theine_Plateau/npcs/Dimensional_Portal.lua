-----------------------------------
-- Area: La Theine Plateau
-- NPC:  Dimensional Portal
-----------------------------------
package.loaded["scripts/zones/La_Theine_Plateau/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/zones/La_Theine_Plateau/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:hasKeyItem(LIGHT_OF_ALTAIEU) == true) or (DIMENSIONAL_PORTAL_UNLOCK == true) then
        player:startEvent(0x00CC);
	else
		player:messageSpecial(ALREADY_OBTAINED_TELE+1); -- Telepoint Disappeared
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
	if (csid == 0x00CC and option == 1) then
		player:setPos(25.299,-2.799,579,193,33); -- To AlTaieu {R}
	end
end;