-----------------------------------
--    Area: Windurst Walls
--  Location: X:-90  Y:-9  Z:109
--    NPC:  Kalupa-Tawalupa
--    Working 100%
--  Involved in Quest: To Bee or Not to Bee?
-----------------------------------

require("scripts/globals/settings");
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
    local ToBee = player:getQuestStatus(WINDURST,TO_BEE_OR_NOT_TO_BEE);
    local ToBeeOrNotStatus = player:getVar("ToBeeOrNot_var");
    
    if (ToBeeOrNotStatus == 10) then 
        player:startEvent(0x0042); -- During Too Bee quest before honey given to Zayhi: "are you alright sir"
    elseif (ToBee == QUEST_ACCEPTED and ToBeeOrNotStatus > 0) then 
            player:startEvent(0x0048); -- During Too Bee quest after some honey was given to Zayhi: "hey did that honey help you just now?"
    elseif (ToBee == QUEST_COMPLETED and player:needToZone()) then
        player:startEvent(0x004d); -- After Too Bee quest but before zone: "well I guess a tooth ache is to be expected"
    else
        player:startEvent(0x012a); -- Normal conversation
    end
end;

-- CS/Event ID List for NPC
-- *CS 443 - player:startEvent(0x01bb); -- Long Star Sybil CS
-- CS 298 - player:startEvent(0x012a); -- Normal conversation
-- *CS 64 - player:startEvent(0x0040); -- Zayhi Coughing
-- CS 66 - player:startEvent(0x0042); -- During Too Bee quest before honey given to Zayhi: "are you alright sir"
-- CS 72 - player:startEvent(0x0048); -- During Too Bee quest after some honey was given to Zayhi: "hey did that honey help you just now?"
-- *CS 75 - player:startEvent(0x004b); -- Combo CS: During Too Bee quest, kicked off from Zayhi
-- CS 77 - player:startEvent(0x004d); -- After Too Bee quest but before zone: "well I guess a tooth ache is to be expected"

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



