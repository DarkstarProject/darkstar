-----------------------------------
-- Area: Bastok Mines
-- NPC: Goraow
-- Starts Quests: Vengeful Wrath
-- @pos 38 .1 14 234
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/zones/Bastok_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    local Vengeful = player:getQuestStatus(BASTOK, VENGEFUL_WRATH);

    if (Vengeful ~= QUEST_AVAILABLE) then
        QuadavHelm = trade:hasItemQty(501,1);
        if (QuadavHelm == true and trade:getItemCount() == 1) then
            player:startEvent(0x006b);
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local Vengeful = player:getQuestStatus(BASTOK,VENGEFUL_WRATH);
    local Fame = player:getFameLevel(BASTOK);
    
    local WildcatBastok = player:getVar("WildcatBastok");
    
    if (player:getQuestStatus(BASTOK,LURE_OF_THE_WILDCAT_BASTOK) == QUEST_ACCEPTED and player:getMaskBit(WildcatBastok,16) == false) then
        player:startEvent(0x01fa);
    elseif (Vengeful == QUEST_AVAILABLE and Fame >= 3) then
        player:startEvent(0x006a);
    else
        player:startEvent(0x0069);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x006a) then
        player:addQuest(BASTOK, VENGEFUL_WRATH);
    elseif (csid == 0x006b) then
        Vengeful = player:getQuestStatus(BASTOK, VENGEFUL_WRATH);
        if (Vengeful == QUEST_ACCEPTED) then
            player:addTitle(95);
            player:addFame(BASTOK,120);
        else
            player:addFame(BASTOK,8);
        end
        player:tradeComplete();
        player:addGil(GIL_RATE*900);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*900);
        player:completeQuest(BASTOK, VENGEFUL_WRATH); -- for save fame
    elseif (csid == 0x01fa) then
        player:setMaskBit(player:getVar("WildcatBastok"),"WildcatBastok",16,true);
    end
end;




