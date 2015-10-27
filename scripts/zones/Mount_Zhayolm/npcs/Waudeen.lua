-----------------------------------
--  Area: Mount_Zhayolm
--  NPC:  Waudeen
--  Type: Assault
--  @pos 673.882 -23.995 367.604 61
-----------------------------------
package.loaded["scripts/zones/Mount_Zhayolm/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/missions");
require("scripts/globals/keyitems");
require("scripts/zones/Mount_Zhayolm/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local IPpoint = player:getCurrency("imperial_standing");

	if (player:getCurrentMission(TOAU) == IMMORTAL_SENTRIES) then
		if (player:hasKeyItem(SUPPLIES_PACKAGE)) then
			player:startEvent(0x0004);
		elseif (player:getVar("TOAUM2") == 1) then
			player:startEvent(0x0005);
		end
	elseif (player:getCurrentMission(TOAU) >= PRESIDENT_SALAHEEM) then
		if (player:hasKeyItem(LEBROS_ASSAULT_ORDERS) and player:hasKeyItem(ASSAULT_ARMBAND) == false) then
			player:startEvent(0x00d1,50,IPpoint);
		else
			player:startEvent(0x0006);
			-- player:delKeyItem(ASSAULT_ARMBAND);
		end
	else
		player:startEvent(0x0003);
	end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
	
	if (csid == 0x00d1 and option == 1) then
       player:delCurrency("imperial_standing", 50);
	   player:addKeyItem(ASSAULT_ARMBAND);
	   player:messageSpecial(KEYITEM_OBTAINED,ASSAULT_ARMBAND);   
	elseif (csid == 0x0004 and option == 1) then
		player:delKeyItem(SUPPLIES_PACKAGE);
		player:setVar("TOAUM2",1);
	end
	
end;

