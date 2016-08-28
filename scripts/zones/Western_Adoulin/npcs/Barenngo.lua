-----------------------------------
--  Area: Western Adoulin
--  NPC: Barenngo
--  Type: Standard NPC and Quest NPC
--  Involved with Quests: 'Dont Ever Leaf Me'
--  @zone 256
--  @pos -101 3 14 256
-----------------------------------
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local DELM = player:getQuestStatus(ADOULIN, DONT_EVER_LEAF_ME);
    if ((DELM == QUEST_ACCEPTED) and (player:getVar("DELM_Barenngo_Branch") < 1)) then
        -- Progresses Quest: 'Dont Ever Leaf Me'
        player:startEvent(0x1397);
    elseif ((DELM == QUEST_ACCEPTED) and (player:getVar("DELM_Barenngo_Branch") < 2)) then
        -- Reminds player of hint for Quest: 'Dont Ever Leaf Me'
        player:startEvent(0x1398);
    else
        -- Standard dialogue
        player:startEvent(0x139A);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    if (csid == 0x1397) then
        -- Progresses Quest: 'Dont Ever Leaf Me'
        player:setVar("DELM_Barenngo_Branch", 1);
    end
end;
