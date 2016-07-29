-----------------------------------
-- Area: Sauromugue Champaign [S]
--  NPC: Bulwark Gate
-- @pos -445 0 342
-- Quest NPC
-----------------------------------
package.loaded["scripts/zones/Sauromugue_Champaign_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/campaign");
require("scripts/zones/Sauromugue_Champaign_[S]/TextIDs");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (player:getQuestStatus(CRYSTAL_WAR, KNOT_QUITE_THERE) == QUEST_ACCEPTED and player:getVar("KnotQuiteThere") == 1) then
        if (trade:hasItemQty(2562,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then
            player:startEvent(0x006A);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    if (player:getQuestStatus(CRYSTAL_WAR, KNOT_QUITE_THERE) == QUEST_ACCEPTED) then
        if (player:getVar("KnotQuiteThere") == 0) then
            player:startEvent(0x0069);
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
    -- printf("CSID:",csid);
    -- printf("RESULT:",option);
    if (csid == 0x0069) then
        player:setVar("KnotQuiteThere",1);
    elseif (csid == 0x006A) then
        player:tradeComplete();
        player:setVar("KnotQuiteThere",2);
    end
end;