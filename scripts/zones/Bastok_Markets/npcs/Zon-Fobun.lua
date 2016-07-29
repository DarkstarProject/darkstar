-----------------------------------
-- Area: Bastok Markets
--   NPC: Zon-Fobun
--  Type: Quest Giver
-- @zone: 235
--  @pos -241.293 -3 63.406
--
-- Auto-Script: Requires Verification. Verified standard dialog - thrydwolf 12/18/2011
-----------------------------------

package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
package.loaded["scripts/globals/quests"] = nil;
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/globals/player");
require("scripts/globals/titles");

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

end;
-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local cCollector = player:getQuestStatus(BASTOK,THE_CURSE_COLLECTOR);
    if (cCollector == QUEST_AVAILABLE and player:getFameLevel(BASTOK) >=4) then
        player:startEvent(0x00fb); -- Quest Start Dialogue

    elseif (cCollector == QUEST_ACCEPTED and player:hasKeyItem(CURSEPAPER) == true and player:getVar("cCollectSilence") == 1 and player:getVar("cCollectCurse") == 1) then
        player:startEvent(0x00fc);        -- Quest Completion Dialogue

    else
        player:startEvent(0x00fa);
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

    if (csid == 0x00fb) then
        player:addQuest(BASTOK,THE_CURSE_COLLECTOR);
        player:addKeyItem(CURSEPAPER); -- Cursepaper
        player:messageSpecial(KEYITEM_OBTAINED,CURSEPAPER);

    elseif (csid == 0x00fc) then
        if (player:getFreeSlotsCount() >= 1) then
            player:delKeyItem(CURSEPAPER);
            player:setVar("cCollectSilence",0);
            player:setVar("cCollectCurse",0);
            player:addFame(BASTOK,30);
            player:completeQuest(BASTOK,THE_CURSE_COLLECTOR);
            player:messageSpecial(ITEM_OBTAINED,16387); -- Poison Cesti
            player:addItem(16387,1);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,16387);
        end
    end
end;