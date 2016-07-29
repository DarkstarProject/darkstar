-----------------------------------
--  Area: Sea Serpent Grotto
--   NPC: Hurr the Betrayer
--  Type: Involved in the "Sahagin Key Quest"
-- @zone: 176
--  @pos 305.882 26.768 234.279
-- 
-----------------------------------
package.loaded["scripts/zones/Sea_Serpent_Grotto/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Sea_Serpent_Grotto/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getVar("SahaginKeyItems") == 1) then --If player was told to use 3 Mythril Beastcoins
        if (trade:hasItemQty(749,3) and trade:hasItemQty(1135,1)) then
            player:startEvent(0x006b); 
        end
    elseif (player:getVar("SahaginKeyItems") == 2) then --If player was told to use a Gold Beastcoin
        if (trade:hasItemQty(748,1) and trade:hasItemQty(1135,1) and trade:getItemCount() == 2) then
            player:startEvent(0x006b);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getVar("SahaginKeyProgress") == 2 and player:hasItem(1197) == false) then --If player has never before finished the quest
        player:startEvent(0x0069);
        player:setVar("SahaginKeyItems",1);
    elseif (player:getVar("SahaginKeyProgress") == 3 and player:getVar("SahaginKeyItems") == 0 and player:hasItem(1197) == false) then
        rand = math.random(2); --Setup random variable to determine which item will be required.
        if (rand == 1) then
            player:startEvent(0x0069); --Requires 3 Mythril Beastcoins and a Norg Shell
            player:setVar("SahaginKeyItems",1);
        elseif (rand == 2) then
            player:startEvent(0x006a); --Requires Gold Beastcoin and a Norg Shell
            player:setVar("SahaginKeyItems",2);
        end
    elseif (player:getVar("SahaginKeyProgress") == 3 and player:getVar("SahaginKeyItems") == 1) then
        player:startEvent(0x0069); --If player was told to use 3 Mythril Beastcoins
    elseif (player:getVar("SahaginKeyProgress") == 3 and player:getVar("SahaginKeyItems") == 2) then
        player:startEvent(0x006a); --If player was told to use a Gold Beastcoin
    elseif (player:getVar("SahaginKeyProgress") == 2 and player:hasItem(1197) == true) then
        player:startEvent(0x0068); --Doesn't offer the key again if the player has one
    else
        player:startEvent(0x0068); --Doesn't offer the key if the player hasn't spoken to the first 2 NPCs
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
    if (csid == 0x006b and player:getVar("SahaginKeyProgress") == 2) then
        player:tradeComplete();
        player:setVar("SahaginKeyProgress",3); --Mark the quest progress
        player:setVar("SahaginKeyItems",0);
        player:addItem(1197); -- Sahagin Key
        player:messageSpecial(ITEM_OBTAINED, 1197); 
    elseif (csid == 0x006b and player:getVar("SahaginKeyProgress") == 3) then
        player:tradeComplete();
        player:setVar("SahaginKeyItems",0);
        player:addItem(1197); -- Sahagin Key
        player:messageSpecial(ITEM_OBTAINED, 1197); 
    end
end;

