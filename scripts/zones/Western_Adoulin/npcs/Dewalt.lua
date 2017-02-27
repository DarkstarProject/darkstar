-----------------------------------
--  Area: Western Adoulin
--  NPC: Dewalt
--  Type: Standard NPC and Quest NPC
--  Involved with Quests: 'Flavors of our Lives'
--                        'Dont Ever Leaf Me'
--  @zone 256
--  @pos -23 0 28 256
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
    local FOOL = player:getQuestStatus(ADOULIN, FLAVORS_OF_OUR_LIVES);
    if ((DELM == QUEST_ACCEPTED) and (player:getVar("DELM_Dewalt_Branch") < 1)) then
        -- Progresses Quest: 'Dont Ever Leaf Me'
        player:startEvent(0x1395);
    elseif ((FOOL == QUEST_ACCEPTED) and ((player:getVar("FOOL_Status") == 1) or (player:getVar("FOOL_Status") == 2)))  then
        if (player:getVar("FOOL_Status") == 1) then
            -- Progresses Quest: 'Flavors of Our Lives'
            player:startEvent(0x0055);
        else
            -- Reminds player of hint for Quest: 'Flavors of Our Lives'
            player:startEvent(0x0069);
        end
    elseif ((DELM == QUEST_ACCEPTED) and (player:getVar("DELM_Dewalt_Branch") < 2)) then
        -- Reminds player of hint for Quest: 'Dont Ever Leaf Me'
        player:startEvent(0x1396);
    else
        -- Standard dialogue
        player:startEvent(0x1399);
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
    if (csid == 0x1395) then
        -- Progresses Quest: 'Dont Ever Leaf Me'
        player:setVar("DELM_Dewalt_Branch", 1);
    elseif (csid == 0x0055) then
        -- Progresses Quest: 'Flavors of Our Lives'
        player:setVar("FOOL_Status", 3);
    end
end;
