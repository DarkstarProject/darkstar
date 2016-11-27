-----------------------------------
-- Area: Selbina
-- NPC: Wachiwi
-- Type: Weather Reporter
-----------------------------------
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Selbina/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if trade:hasItemQty(11967,1) then -- pants (FEMALES)
	-- Remove old item traded
		for i = LOC_INVENTORY, LOC_WARDROBE4 do -- inventory locations enums
			itemId = 11967 -- PANTS (FEMALE)
            if (player:hasItem(itemId, i)) then
                player:delItem(itemId, 1, i);
                break;
            end
        end
		-- END remove old item
		itemId = 11968; -- PANTS +1 (FEMALE)
		quantity = 1;
		player:PrintToPlayer("Wachiwi : Oh ma'am you came to get these pants enhanced. ", 0x1F);
		player:PrintToPlayer("Wachiwi : Sure I can do it, one moment please....", 0x1F);
		player:PrintToPlayer("<Wachiwi hands what looks like your pants back to you...>", 0xE);
		player:addItem(itemId, quantity);
		player:PrintToPlayer("You obtained the Dream Pants +1.", 0xF);
		player:PrintToPlayer("Wachiwi : You know, I heard rumor that there is a matching coat, maybe if you show these to", 0x1F);
		player:PrintToPlayer("Wachiwi : a Smile Helper they can tell you about the coat.", 0x1F);
	elseif trade:hasItemQty(11965,1) then -- trousers
	-- Remove old item traded
		for i = LOC_INVENTORY, LOC_WARDROBE4 do -- inventory locations enums
			itemId = 11965 -- trousers
            if (player:hasItem(itemId, i)) then
                player:delItem(itemId, 1, i);
                break;
            end
        end
		-- END remove old item
		itemId = 11966; -- trousers +1
		quantity = 1;
		player:PrintToPlayer("Wachiwi : Oh sir, you came to get these pants enhanced? ", 0x1F);
		player:PrintToPlayer("Wachiwi : Sure I can do it, one moment please....", 0x1F);
		player:PrintToPlayer("<Wachiwi hands what looks like your pants back to you...>", 0xE);
		player:addItem(itemId, quantity);
		player:PrintToPlayer("You obtained the Dream Trousers +1.", 0xF);
		player:PrintToPlayer("Wachiwi : You know, I heard rumor that there is a matching coat, maybe if you show these to", 0x1F);
		player:PrintToPlayer("Wachiwi : a Smile Helper they can tell you about the coat.", 0x1F);
	else
		player:PrintToPlayer("<Wachiwi sighs>", 0xE);
		player:PrintToPlayer("(This must not be the item she's looking for...)", 0xF);
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0x01F6,0,0,0,0,0,0,0,VanadielTime());
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