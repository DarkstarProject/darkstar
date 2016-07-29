-----------------------------------
-- Area: Vunkerl Inlet (S) (H-6)
-- NPC: ???
-- Involved in Quests
-- @pos -26 -31 364
-----------------------------------
package.loaded["scripts/zones/Vunkerl_Inlet_[S]/TextIDs"] = nil;
package.loaded["scripts/globals/quests"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Vunkerl_Inlet_[S]/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getQuestStatus(CRYSTAL_WAR, BOY_AND_THE_BEAST) == QUEST_AVAILABLE and player:getVar("BoyAndTheBeast") == 2) then
        player:startEvent(0x0069);
    elseif (player:getQuestStatus(CRYSTAL_WAR, BOY_AND_THE_BEAST) == QUEST_ACCEPTED and player:getVar("BoyAndTheBeast") == 3) then
        player:startEvent(0x006C);
    elseif (player:getQuestStatus(CRYSTAL_WAR, BOY_AND_THE_BEAST) == QUEST_ACCEPTED and player:getVar("BoyAndTheBeast") == 4) then
        player:startEvent(0x006D);
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x0069) then
        player:addQuest(CRYSTAL_WAR, BOY_AND_THE_BEAST);
        player:addKeyItem(VUNKERL_HERB_MEMO);
        player:messageSpecial(KEYITEM_OBTAINED, VUNKERL_HERB_MEMO);
    elseif (csid == 0x006C) then
        if(player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17384); -- Carbon Fishing Rod
        else
            player:completeQuest(CRYSTAL_WAR, BOY_AND_THE_BEAST);
            player:delKeyItem(VUNKERL_HERB_MEMO);
            player:delKeyItem(VUNKERL_HERB);
            player:addItem(17384);
            player:messageSpecial(ITEM_OBTAINED,17384); --Carbon Fishing Rod
        end
    elseif (csid == 0x006D) then
        player:delKeyItem(VUNKERL_HERB);
        player:setVar("BoyAndTheBeast",2);
    end     
end;
