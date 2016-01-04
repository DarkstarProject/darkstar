----------------------------------
--  Area: Grauberg [S]
--  NPC: Indescript Markings
--  Type: Quest
-----------------------------------
package.loaded["scripts/zones/Grauberg_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Grauberg_[S]/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/npc_util");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local gownQuestProgress = player:getVar("AF_SCH_BODY");

    player:delStatusEffect(EFFECT_SNEAK);

    -- SCH AF Quest - Boots
    if (gownQuestProgress > 0 and gownQuestProgress < 3 and player:hasKeyItem(SAMPLE_OF_GRAUBERG_CHERT) == false) then
    
        player:addKeyItem(SAMPLE_OF_GRAUBERG_CHERT);
        player:messageSpecial(KEYITEM_OBTAINED, SAMPLE_OF_GRAUBERG_CHERT);
        player:setVar("AF_SCH_BODY", gownQuestProgress + 1);

        -- Move the markings around
        local positions = {
            [1] = {-517, -167, 209}, 
            [2] = {-492, -168, 190}, 
            [3] = {-464, -166, 241}, 
            [4] = {-442, -156, 182}, 
            [5] = {-433, -151, 162}, 
            [6] = {-416, -143, 146}, 
            [7] = {-535, -167, 227},  
            [8] = {-513, -170, 255}
        };
        
        local newPosition = npcUtil.pickNewPosition(npc:getID(), positions);
        
        npc:setPos(positions[newPosition][1], positions[newPosition][2], positions[newPosition][3]);
        -- player:PrintToPlayer("Markings moved to position index " .. newPosition);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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
end;
