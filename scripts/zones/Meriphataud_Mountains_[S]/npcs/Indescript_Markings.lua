----------------------------------
-- Area: Meriphataud_Mountains_[S]
--  NPC: Indescript Markings
-- Type: Quest
-- !pos -389 -9 92 1 96
-----------------------------------
package.loaded["scripts/zones/Meriphataud_Mountains_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Meriphataud_Mountains_[S]/TextIDs");
require("scripts/globals/keyitems");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local loafersQuestProgress = player:getVar("AF_SCH_BOOTS");

    player:delStatusEffect(dsp.effect.SNEAK);

    -- SCH AF Quest - Boots
    if (loafersQuestProgress > 0 and loafersQuestProgress < 3 and player:hasKeyItem(dsp.ki.DROGAROGAN_BONEMEAL) == false) then
        player:addKeyItem(dsp.ki.DROGAROGAN_BONEMEAL);
        player:messageSpecial(KEYITEM_OBTAINED, dsp.ki.DROGAROGAN_BONEMEAL);
        player:setVar("AF_SCH_BOOTS", loafersQuestProgress + 1);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;

