-----------------------------------
-- Area: Port Windurst
-- NPC:  Mhe Quryobhi
-- Working 100%
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if trade:hasItemQty(15752,1) then -- Boots
	-- Remove old item traded
		for i = LOC_INVENTORY, LOC_WARDROBE4 do -- inventory locations enums
			itemId = 15752 -- Boots
            if (player:hasItem(itemId, i)) then
                player:delItem(itemId, 1, i);
                break;
            end
        end
		-- END remove old item
		itemId = 15753; -- Boots +1
		quantity = 1;
		player:PrintToPlayer("Mhe Quryobhi : Squeeeeeeeeeeeeeeeeeeeee!", 0x1F);
		player:PrintToPlayer("Mhe Quryobhi : You brought me shoes!!!! ZOMG ZOMG ZOMG", 0x1F);
		player:PrintToPlayer("Mhe Quryobhi : THEY ARE SOOOO PERRRRRTYYYYY", 0x1F);
		player:PrintToPlayer("<Mhe Quryobhi dances happily>", 0xE);
		player:PrintToPlayer("Mhe Quryobhi : I had some similar that I had enhanced, since you're so kind", 0x1F);
		player:PrintToPlayer("Mhe Quryobhi : please take them with you! Happy Starlight Celebration Adventurer!", 0x1F);
		player:addItem(itemId, quantity);
		player:PrintToPlayer("You obtained the Dream Boots +1.", 0xF);
		player:PrintToPlayer("Mhe Quryobhi : You should show them to a Smile Helper! They love seeing this style!", 0x1F);
	else
		player:PrintToPlayer("<Mhe Quryobhi sighs>", 0x1F);
		player:PrintToPlayer("(This must not be the item she's looking for...)", 0xF);
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:startEvent(0xce);
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
