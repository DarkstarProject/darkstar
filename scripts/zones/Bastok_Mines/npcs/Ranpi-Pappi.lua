-----------------------------------
--  Area: Bastok Mines
--   NPC: Ranpi-Pappi
--  Type: Standard NPC
-- @zone 234
-- !pos -4.535 -1.044 49.881
--
-- Auto-Script: Requires Verification (Verified by Brando)
-----------------------------------

package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if trade:hasItemQty(15178,1) then -- HAT
	-- Remove old item traded
		for i = LOC_INVENTORY, LOC_WARDROBE4 do -- inventory locations enums
			itemId = 15178 -- HAT
            if (player:hasItem(itemId, i)) then
                player:delItem(itemId, 1, i);
                break;
            end
        end
		-- END remove old item
		itemId = 15179; -- HAT +1
		quantity = 1;
		player:PrintToPlayer("Ranpi-Pappi : Whaa?", 0x1F);
		player:PrintToPlayer("Ranpi-Pappi : Wow this hat is just like my great grandfather's...", 0x1F);
		player:PrintToPlayer("Ranpi-Pappi : I think I have it here somewhere...", 0x1F);
		player:PrintToPlayer("<Ranpi-Pappi hands you something>", 0xE);
		player:addItem(itemId, quantity);
		player:PrintToPlayer("You obtained the Dream Hat +1.", 0xF);
		player:PrintToPlayer("Ranpi-Pappi : Now we can match Adventurer! Show it off to your friends and Smile Helpers!", 0x1F);
	else
		player:PrintToPlayer("<Ranpi-Pappi sighs>", 0xE);
		player:PrintToPlayer("(This must not be the item he's looking for...)", 0xF);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x004d);
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
end;

