-----------------------------------
-- Area: Sauromugue Champaign [S]
--  NPC: Indescript Markings
-- @pos 322 24 113
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
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    if (player:getQuestStatus(CRYSTAL_WAR, DOWNWARD_HELIX) == QUEST_ACCEPTED and player:getVar("DownwardHelix") == 3) then
        player:startEvent(0x0004);
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
    if (csid == 0x0004) then
        player:setVar("DownwardHelix",4);
    end
end;