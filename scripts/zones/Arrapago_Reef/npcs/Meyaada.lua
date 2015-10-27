-----------------------------------
-- Area: Arrapago Reef
-- NPC:  Meyaada
-- @pos 22.446 -7.920 573.390 54
-----------------------------------
package.loaded["scripts/zones/Arrapago_Reef/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Arrapago_Reef/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	--print(IPpoint);
	--print(assault);
	
    local IPpoint = player:getCurrency("imperial_standing");

	if (player:getCurrentMission(TOAU) == IMMORTAL_SENTRIES) then
		if (player:hasKeyItem(SUPPLIES_PACKAGE)) then
			player:startEvent(0x0005);
		elseif (player:getVar("TOAUM2") == 1) then
			player:startEvent(0x0006);
		end
	elseif (player:getCurrentMission(TOAU) >= PRESIDENT_SALAHEEM) then
		if (player:hasKeyItem(ILRUSI_ASSAULT_ORDERS) and player:hasKeyItem(ASSAULT_ARMBAND) == false) then
			player:startEvent(0x00DF,50,IPpoint);
		else
			player:startEvent(0x0007);
			-- player:delKeyItem(ASSAULT_ARMBAND);
		end
	else
		player:startEvent(0x0004);
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
	
	if (csid == 0x00DF and option == 1) then
       player:delCurrency("imperial_standing", 50);
	   player:addKeyItem(ASSAULT_ARMBAND);
	   player:messageSpecial(KEYITEM_OBTAINED,ASSAULT_ARMBAND);   
	elseif (csid == 0x0005 and option == 1) then
		player:delKeyItem(SUPPLIES_PACKAGE);
		player:setVar("TOAUM2",1);
	end
	
end;