-----------------------------------
--  Area: Beaucedine Glacier
--  NPC:  Lonely Evergreen
-----------------------------------
package.loaded["scripts/zones/Beaucedine_Glacier/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if trade:hasItemQty(10382,1) then -- Mittens
	-- Remove old item traded
		for i = LOC_INVENTORY, LOC_WARDROBE4 do -- inventory locations enums
			itemId = 10382 -- Mittens
            if (player:hasItem(itemId, i)) then
                player:delItem(itemId, 1, i);
                break;
            end
        end
		-- END remove old item
		itemId = 10383; -- Mittens +1
		quantity = 1;
		player:PrintToPlayer("places the mittens on the tree...", 8);
		player:PrintToPlayer("<The tree begins to glow....>", 0xE);
		player:addItem(itemId, quantity);
		player:PrintToPlayer("You obtained the Dream Mittens +1.", 0xF);
		player:PrintToPlayer("<You sense a feeling to take the gloves back...>", 0xE);
		player:PrintToPlayer("Maybe you should show the Smile Helper what happened...", 0xE);
	else
		player:PrintToPlayer("<The tree farts>", 0xE);
		player:PrintToPlayer("(Try again...)", 0xF);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
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

