-----------------------------------
-- Area: Sea Serpent Grotto
-- NPC:  ??? Used for Norg quest "It's not your vault"
-- @zone 176
-- @pos -173 26 252 2
-----------------------------------
package.loaded["scripts/zones/Sea_Serpent_Grotto/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Sea_Serpent_Grotto/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    Vault = player:getQuestStatus(OUTLANDS,ITS_NOT_YOUR_VAULT);
    
    if (Vault == QUEST_ACCEPTED and player:hasKeyItem(295) == false) then
        player:addKeyItem(295);
        player:messageSpecial(KEYITEM_OBTAINED,295);
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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;