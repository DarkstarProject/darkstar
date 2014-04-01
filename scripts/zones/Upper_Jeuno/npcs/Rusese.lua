-----------------------------------
-- Area: Upper Jeuno
-- NPC: Rusese
-- Map Seller NPC
-----------------------------------

require("scripts/globals/keyitems");
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
require("scripts/zones/Upper_Jeuno/TextIDs");

-----------------------------------
-- Initialisation
-----------------------------------

Maps = 
{
	MAP_OF_THE_SAN_DORIA_AREA, 200,
	MAP_OF_THE_BASTOK_AREA, 200,
	MAP_OF_THE_WINDURST_AREA, 600,
	MAP_OF_THE_JEUNO_AREA, 3000,
	MAP_OF_QUFIM_ISLAND, 3000,
	MAP_OF_THE_ELDIEME_NECROPOLIS, 3000,
	MAP_OF_THE_GARLAIGE_CITADEL, 3000,
	MAP_OF_THE_ELSHIMO_REGIONS, 3000
};

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)

	Filter = 0;
	index  = 2;
	
	for i = 1, #Maps, 2 do
		index = index * 2;
		if (player:hasKeyItem(Maps[i])) then
			Filter = Filter + index;
		end
	end
	
    player:startEvent(0x2710, Filter);
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

	if (csid == 0x2710 and option ~= 0x40000000) then
		for i = 1, #Maps, 2 do
			if (Maps[i] == option) then
				if (player:delGil(Maps[i+1])) then
					player:addKeyItem(option);
					player:messageSpecial(KEYITEM_OBTAINED,option);
				else
					player:messageSpecial(NOT_HAVE_ENOUGH_GIL);
				end
				break;
			end
		end
	end
end;



