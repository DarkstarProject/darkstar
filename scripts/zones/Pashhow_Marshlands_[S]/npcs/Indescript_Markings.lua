-----------------------------------
-- Area: Pashhow Marshlands [S]
--  NPC: Indescript Markings
-- @pos -455 24 -364
-----------------------------------
package.loaded["scripts/zones/Pashhow_Marshlands_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/globals/campaign");
require("scripts/zones/Pashhow_Marshlands_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local onSabbatical = player:getQuestStatus(CRYSTAL_WAR,ON_SABBATICAL);
    local onSabbaticalProgress = player:getVar("OnSabbatical");
    if (onSabbatical == QUEST_ACCEPTED) then
        if (onSabbaticalProgress == 2 ) then
            player:startEvent(2);
        end
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
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 2) then
        player:addKeyItem(SCHULTS_SEALED_LETTER);
        player:messageSpecial(KEYITEM_OBTAINED, SCHULTS_SEALED_LETTER);
        player:setVar("OnSabbatical", 3);
    end
end;