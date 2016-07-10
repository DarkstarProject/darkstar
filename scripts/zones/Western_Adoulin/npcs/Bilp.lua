-----------------------------------
--  Area: Western Adoulin
--  NPC: Bilp
--  Type: Standard NPC and Quest NPC
--  Starts and Involved with Quest: 'Scaredy-Cats'
--  @zone 256
--  @pos -91 3 0 256
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
    local Scaredycats = player:getQuestStatus(ADOULIN, SCAREDYCATS);
    local Scaredycats_Status = player:getVar("Scaredycats_Status");
    if ((Scaredycats_Status < 1) and (Scaredycats == QUEST_AVAILABLE)) then
        -- Dialogue before seeing the initial walk-in CS with Bilp, Eamonn, and Lhe.
        player:startEvent(0x13A7);
    elseif (Scaredycats_Status == 1) then
        if (Scaredycats == QUEST_ACCEPTED) then
            -- Reminder for Quest: 'Scaredy-Cats', go to Ceizak Battlegrounds
            player:startEvent(0x13A1);
        else
            -- Starts Quest: 'Scaredy-Cats', after first refusal.
            player:startEvent(0x13A0);
        end
    elseif (Scaredycats_Status == 2) then
        -- Reminder for Quest: 'Scaredy-Cats', go to Sih Gates.
        player:startEvent(0x13A2);
    else
        -- Dialogue after completeing Quest: 'Scaredy-Cats'
        player:startEvent(0x13A5);
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
    if ((csid == 0x13A0) and (option == 1)) then
        -- Starts Quest: 'Scaredy-Cats', after first refusal.
        player:setVar("Scaredycats_Status", 2);
        player:addQuest(ADOULIN, SCAREDYCATS);
    end
end;
