-----------------------------------
-- Area: Castle Oztroja
-- NPC:  qm1 (???)
-- Involved in Quest: True Strength
-- @pos -100 -71 -132 151
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Castle_Oztroja/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    
    if (player:getQuestStatus(BASTOK,TRUE_STRENGTH) == QUEST_ACCEPTED and player:hasItem(1100) == false) then
        if (trade:hasItemQty(4558,1) and trade:getItemCount() == 1) then -- Trade Yagudo Drink
            player:tradeComplete();
            player:messageSpecial(SENSE_OF_FOREBODING);
            SpawnMob(17396140,180):updateClaim(player);
        end
    end
    
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;