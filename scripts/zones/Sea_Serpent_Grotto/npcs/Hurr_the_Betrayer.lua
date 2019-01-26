-----------------------------------
-- Area: Sea Serpent Grotto
--   NPC: Hurr the Betrayer
-- Type: Involved in the "Sahagin Key Quest"
-- !pos 305.882 26.768 234.279 176
-----------------------------------
local ID = require("scripts/zones/Sea_Serpent_Grotto/IDs")
-----------------------------------

function onTrade(player, npc, trade)
    if player:getVar("SahaginKeyItems") == 1 then -- If player was told to use 3 Mythril Beastcoins
        if npcUtil.tradeHas(trade, {{749, 3}, {1135, 1}}) then
            player:startEvent(107)
        end
    elseif (player:getVar("SahaginKeyItems") == 2) then -- If player was told to use a Gold Beastcoin
        if npcUtil.tradeHas(trade, {748, 1135}) then
            player:startEvent(107)
        end
    end
end

function onTrigger(player, npc)
    if player:getVar("SahaginKeyProgress") == 2 and not player:hasItem(1197) then -- If player has never before finished the quest
        player:startEvent(105)
        player:setVar("SahaginKeyItems", 1)
    elseif player:getVar("SahaginKeyProgress") == 3 and player:getVar("SahaginKeyItems") == 0 and not player:hasItem(1197) then
        if math.random(2) == 1 then
            player:startEvent(105) -- Requires 3 Mythril Beastcoins and a Norg Shell
            player:setVar("SahaginKeyItems", 1)
        else
            player:startEvent(106) -- Requires Gold Beastcoin and a Norg Shell
            player:setVar("SahaginKeyItems", 2)
        end
    elseif player:getVar("SahaginKeyProgress") == 3 and player:getVar("SahaginKeyItems") == 1 then
        player:startEvent(105) -- If player was told to use 3 Mythril Beastcoins
    elseif player:getVar("SahaginKeyProgress") == 3 and player:getVar("SahaginKeyItems") == 2 then
        player:startEvent(106) -- If player was told to use a Gold Beastcoin
    elseif player:getVar("SahaginKeyProgress") == 2 and player:hasItem(1197) then
        player:startEvent(104) -- Doesn't offer the key again if the player has one
    else
        player:startEvent(104) -- Doesn't offer the key if the player hasn't spoken to the first 2 NPCs
    end
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    if csid == 107 and player:getVar("SahaginKeyProgress") == 2 and npcUtil.giveItem(player, 1197) then
        player:confirmTrade()
        player:setVar("SahaginKeyProgress", 3) -- Mark the quest progress
        player:setVar("SahaginKeyItems", 0)
    elseif csid == 107 and player:getVar("SahaginKeyProgress") == 3 and npcUtil.giveItem(player, 1197) then
        player:confirmTrade()
        player:setVar("SahaginKeyItems", 0)
    end
end
