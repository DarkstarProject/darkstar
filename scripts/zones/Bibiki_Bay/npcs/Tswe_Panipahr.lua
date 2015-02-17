-----------------------------------
--  Area: Bibiki Bay
--  NPC:  Tswe Panipahr
--  Type: Manaclipper
--  @pos 484.604 -4.035 729.671 4
-----------------------------------

package.loaded["scripts/zones/Bibiki_Bay/TextIDs"] = nil;

require("scripts/zones/Bibiki_Bay/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:startEvent(0x0023, MANACLIPPER_TICKET, MANACLIPPER_MULTITICKET, 80, 2, 0, 500, 0, 0);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);

	if (csid == 0x0023) then

		local manaclipperTickets = 0;

		if (player:hasKeyItem(MANACLIPPER_TICKET)) then
			manaclipperTickets = 1;
		end

		if (player:hasKeyItem(MANACLIPPER_MULTITICKET)) then
			manaclipperTickets = manaclipperTickets + 2;
		end

		player:updateEvent(MANACLIPPER_TICKET, MANACLIPPER_MULTITICKET, manaclipperTickets, player:getGil(), player:getVar("Manaclipper_Ticket"), 500, 0, 0);
	end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	 printf("CSIDf: %u",csid);
	 printf("RESULTf: %u",option);

	if(csid == 0x0023)then
		if (option==1)then
			player:delGil(80);
			player:addKeyItem(MANACLIPPER_TICKET);
			player:messageSpecial(KEYITEM_OBTAINED,MANACLIPPER_TICKET);
		elseif(option==2)then
			player:delGil(500);
			player:addKeyItem(MANACLIPPER_MULTITICKET);
			player:messageSpecial(KEYITEM_OBTAINED,MANACLIPPER_MULTITICKET);
			player:setVar("Manaclipper_Ticket",10);
		end
	end
end;