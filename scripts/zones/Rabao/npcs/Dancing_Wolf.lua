-----------------------------------
--  Area: Rabao
--   NPC: Dancing Wolf
--  Type: Standard NPC
-- @zone 247
-- !pos 7.619 7 81.209
--
-- Auto-Script: Requires Verification (Verified by Brawndo)
-----------------------------------
package.loaded["scripts/zones/Rabao/TextIDs"] = nil;
-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if trade:hasItemQty(18863,1) then -- DREAM BELL 
	-- Remove old item traded
		for i = LOC_INVENTORY, LOC_WARDROBE4 do -- inventory locations enums
			itemId = 18863 -- DREAM BELL REMOVAL
            if (player:hasItem(itemId, i)) then
                player:delItem(itemId, 1, i);
                break;
            end
        end
		-- END remove old item
		itemId = 18864; -- Dream Bell + 1
		quantity = 1;
		player:PrintToPlayer("Dancing Wolf : A bell for me?", 0x1F);
		player:PrintToPlayer("Dancing Wolf : Here, I'll take yours but I want you to have mine.", 0x1F);
		player:PrintToPlayer("Dancing Wolf : Show that to the Smile Helper, thank you so much adventurer!", 0x1F);
		player:PrintToPlayer("<Dancing Wolf dances happily>", 0xE);
		player:addItem(itemId, quantity);
		player:PrintToPlayer("You obtained the Dream Bell +1.", 0xF);
	else
		player:PrintToPlayer("<Dancing Wolf sighs>", 0xE);
		player:PrintToPlayer("(This must not be the item he's looking for...)", 0xF);
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
if (player:getCurrentMission(BASTOK) == THE_SALT_OF_THE_EARTH and player:getVar("BASTOK91") == 1) then
player:startEvent(0x0066);
elseif (player:getCurrentMission(BASTOK) == THE_SALT_OF_THE_EARTH and player:getVar("BASTOK91") == 2) then
player:startEvent(0x0067);
elseif (player:getCurrentMission(BASTOK) == THE_SALT_OF_THE_EARTH and player:getVar("BASTOK91") == 3 and player:hasKeyItem(MIRACLESALT)) then
player:startEvent(0x0068);
elseif (player:getVar("BASTOK91") == 4) then
player:startEvent(0x0069);
else
player:startEvent(0x006A);
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
if (csid == 0x0066) then
player:setVar("BASTOK91",2);
elseif (csid == 0x0068) then
player:setVar("BASTOK91",4);
end
end;

