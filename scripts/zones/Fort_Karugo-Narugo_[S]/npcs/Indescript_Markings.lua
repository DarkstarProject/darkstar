----------------------------------
--  Area: Fort Karugo Narugo [S]
--  NPC: Indescript Markings
--  Type: Quest
--  @zone: 96
--  @pos -63 -75 4
-----------------------------------
package.loaded["scripts/zones/Fort_Karugo-Narugo_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Fort_Karugo-Narugo_[S]/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/npc_util");

-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local loafersQuestProgress = player:getVar("AF_SCH_BOOTS");

    player:delStatusEffect(EFFECT_SNEAK);

    -- SCH AF Quest - Boots
    if (loafersQuestProgress > 0 and loafersQuestProgress < 3 and player:hasKeyItem(RAFFLESIA_DREAMSPIT) == false) then
    
        player:addKeyItem(RAFFLESIA_DREAMSPIT);
        player:messageSpecial(KEYITEM_OBTAINED, RAFFLESIA_DREAMSPIT);
        player:setVar("AF_SCH_BOOTS", loafersQuestProgress + 1);

        -- Move the markings around
        local positions = {
            [1] = {-72.612, -28.5, 671.24}, -- G-5 NE
            [2] = {-158,    -61,   268},    -- G-7
            [3] = {-2,      -52,   235},    -- H-8
            [4] = {224,     -28,   -22},    -- I-10
            [5] = {210,     -42,   -78},    -- I-9
            [6] = {-176,    -37,   617},    -- G-5 SW
            [7] = {29,      -13,   710}     -- H-5
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
    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
