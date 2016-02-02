----------------------------------
--  Area: Meriphataud_Mountains_[S]
--  NPC: Indescript Markings
--  Type: Quest
--  @pos -389 -9 92 1 96
-----------------------------------
package.loaded["scripts/zones/Meriphataud_Mountains_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Meriphataud_Mountains_[S]/TextIDs");
require("scripts/globals/keyitems");

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
    if (loafersQuestProgress > 0 and loafersQuestProgress < 3 and player:hasKeyItem(DROGAROGAN_BONEMEAL) == false) then
        player:addKeyItem(DROGAROGAN_BONEMEAL);
        player:messageSpecial(KEYITEM_OBTAINED, DROGAROGAN_BONEMEAL);
        player:setVar("AF_SCH_BOOTS", loafersQuestProgress + 1);       
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

