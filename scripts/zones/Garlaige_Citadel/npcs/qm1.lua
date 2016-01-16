-----------------------------------
-- Area: Garlaige Citadel
-- NPC:  qm1 (???)
-- Involved In Quest: Altana's Sorrow
-- @pos -282.339 0.001 261.707 200
-----------------------------------
package.loaded["scripts/zones/Garlaige_Citadel/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Garlaige_Citadel/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local AltanaSorrow = player:getQuestStatus(BASTOK,ALTANA_S_SORROW);
    local VirnageLetter = player:hasKeyItem(LETTER_FROM_VIRNAGE);
    local DivinePaint = player:hasKeyItem(BUCKET_OF_DIVINE_PAINT);

    if (AltanaSorrow == QUEST_ACCEPTED and VirnageLetter == false and DivinePaint == false) then
        player:addKeyItem(BUCKET_OF_DIVINE_PAINT);
        player:messageSpecial(KEYITEM_OBTAINED,BUCKET_OF_DIVINE_PAINT);
    else
        player:messageSpecial(YOU_FIND_NOTHING);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;




