-----------------------------------
-- Area: Upper Jeuno
-- NPC: Rusese
-- Map Seller NPC
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil;
package.loaded["scripts/globals/magic_maps"] = nil;
-----------------------------------
require("scripts/globals/magic_maps");
require("scripts/zones/Upper_Jeuno/TextIDs");
-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)

	CheckMaps(player, npc, 0x2710);
	--player:startEvent(0x2710, Filter);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	if (csid == 0x2710) then
		CheckMapsUpdate(player, option, NOT_HAVE_ENOUGH_GIL, KEYITEM_OBTAINED);
	end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)

end;



