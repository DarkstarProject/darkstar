-----------------------------------
-- Area: Bibiki Bay
-- NPC:  Toh Zonikki
-- Type: Clamming NPC
-- @pos -371 -1 -421 4
-----------------------------------

package.loaded["scripts/zones/Bibiki_Bay/TextIDs"] = nil;

require("scripts/zones/Bibiki_Bay/TextIDs");
require("scripts/globals/keyitems");

-----------------------------------
-- Local Variables
-----------------------------------

local clammingItems = { 1311,  -- Oxblood                          
            885,   -- Turtle Shell          
            1193,  -- HQ Crab Shell  
            1446,  -- Lacquer Tree Log
            4318,  -- Bibiki Urchin
            1586,  -- Titanictus Shell
            5124,  -- Tropical Clam
            690,   -- Elm Log
            887,   -- Coral Fragment
            703,   -- Petrified Log 
            691,   -- Maple Log 
            4468,  -- Pamamas
            3270,  -- HQ Pugil Scales 
            888,   -- Seashell
            4328,  -- Hobgoblin Bread
            485,   -- Broken Willow Rod
            510,   -- Goblin Armor
            5187,  -- Elshimo Coconut
            507,   -- Goblin Mail
            881,   -- Crab Shell
            4325,  -- Hobgoblin Pie
            936,   -- Rock Salt  
            4361,  -- Nebimonite 
            864,   -- Fish Scales
            4484,  -- Shall Shell   
            624,   -- Pamtam Kelp  
            1654,  -- Igneous Rock
            17296, -- Pebble    
            5123,  -- Jacknife  
            5122   -- Bibiki Slug
              };

-----------------------------------
-- Local Functions
-----------------------------------

local function giveClammedItems(player)
    
    for item = 1, table.getn(clammingItems) do
        local clammedItemQty = player:getVar("ClammedItem_" ..  clammingItems[item]);

        if (clammedItemQty > 0) then
            if (player:addItem(clammingItems[item],clammedItemQty)) then

                player:messageSpecial(YOU_OBTAIN, clammingItems[item], clammedItemQty);
                player:setVar("ClammedItem_" ..  clammingItems[item], 0);
            else
                player:messageSpecial(WHOA_HOLD_ON_NOW);
                break;
            end
        end
    end
end;

local function owePlayerClammedItems(player)

    for item = 1, table.getn(clammingItems) do
        if (player:getVar("ClammedItem_" ..  clammingItems[item]) > 0) then
            return true;
        end
    end

    return false;
end;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if ( player:hasKeyItem(CLAMMING_KIT)) then -- Player has clamming kit

        if (player:getVar("ClammingKitBroken") == 1) then -- Broken bucket
            player:startEvent(0x001E, 0, 0, 0, 0, 0, 0, 0, 0);
        else --Bucket not broken
            player:startEvent(0x001D, 0, 0, 0, 0, 0, 0, 0, 0);
        end
    else -- Player does not have clamming kit
        if (owePlayerClammedItems(player)) then
            player:messageSpecial(YOU_GIT_YER_BAG_READY);
            giveClammedItems(player);
        else
            player:startEvent(0x001C, 500, 0, 0, 0, 0, 0, 0, 0);
        end
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x001C) then
        local enoughMoney = 2; -- Not enough money
        if (player:getGil() >= 500) then
            enoughMoney = 1; --Player has enough Money
        end

        player:updateEvent(CLAMMING_KIT, enoughMoney, 0, 0, 0, 500, 0, 0);
    elseif  (csid == 0x001D) then
        local clammingKitSize = player:getVar("ClammingKitSize");
        
        player:updateEvent( player:getVar("ClammingKitWeight"), clammingKitSize, clammingKitSize, clammingKitSize + 50, 0, 0, 0, 0);
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x001C) then
        if (option == 1) then -- Give 50pz clamming kit
            player:setVar("ClammingKitSize", 50);
            player:addKeyItem(CLAMMING_KIT);
            player:delGil(500);
            player:messageSpecial(KEYITEM_OBTAINED,CLAMMING_KIT);
        end
    elseif (csid == 0x001D) then
        if (option == 2) then -- Give player clammed items
            
            player:setVar("ClammingKitSize", 0);
            player:setVar("ClammingKitWeight", 0);
            player:delKeyItem(CLAMMING_KIT);
            player:messageSpecial(YOU_RETURN_THE,CLAMMING_KIT);

            giveClammedItems(player);

        elseif (option == 3) then -- Get bigger kit
            local clammingKitSize = player:getVar("ClammingKitSize") + 50;

            player:setVar("ClammingKitSize", clammingKitSize);
            player:messageSpecial(YOUR_CLAMMING_CAPACITY, 0, 0, clammingKitSize);
        end        
    elseif ( csid == 0x001E) then -- Broken bucket
        player:setVar("ClammingKitSize", 0);
        player:setVar("ClammingKitBroken", 0);
        player:setVar("ClammingKitWeight", 0);
        player:delKeyItem(CLAMMING_KIT);
        player:messageSpecial(YOU_RETURN_THE,CLAMMING_KIT);
    end
end;