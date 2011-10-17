-----------------------------------
--	Area: Lower Jeuno
--	NPC:  Derrick
--
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

pass = player:hasKeyItem(0x08);

	if (pass == 1) then
		player:startEvent(0xe6,14);
	else
		player:startEvent(0xe6,13);
	end
end;

-----------------------------------
-- onEventUpdate Action
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

currGil = player:getGil();

	if ((csid == 0xe6) and (option == 10)) then
		if (currGil >= 500000) then
			player:delGil(500000);
			player:addKeyItem(0x08);
			player:updateEvent(0,1);
		end
	end

end;

-----------------------------------
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if ((csid == 0xe6) and (option == 10)) then
		if (player:hasKeyItem(0x08) == 1) then
			player:messageSpecial(KEYITEM_OBTAINED,0x08);
		end
	end
end;



