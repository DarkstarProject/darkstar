-----------------------------------
--  Area: Windurst Waters (S)
--  NPC: Door Acolyte hostel
--  @pos 125 -2 216 94
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------
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
    if (player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STIRS)==QUEST_ACCEPTED and player:hasKeyItem(SMALL_STARFRUIT)) then
        player:startEvent(0x0081);
    elseif (player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STRIKES) == QUEST_COMPLETED and player:getQuestStatus(CRYSTAL_WAR, KNOT_QUITE_THERE) == QUEST_AVAILABLE) then
        if (player:getCurrentMission(WOTG) == CAIT_SITH or player:hasCompletedMission(WOTG, CAIT_SITH)) then
            player:startEvent(0x0097);
        end
    elseif (player:getQuestStatus(CRYSTAL_WAR, KNOT_QUITE_THERE) == QUEST_ACCEPTED) then
        player:startEvent(0x0098);
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
    if (csid == 0x0081) then
        player:addItem(4144); -- hi-elixir
        player:messageSpecial(ITEM_OBTAINED, 4144);
        player:delKeyItem(SMALL_STARFRUIT);
        player:addKeyItem(BRASS_RIBBON_OF_SERVICE);
        player:messageSpecial(KEYITEM_OBTAINED, BRASS_RIBBON_OF_SERVICE);
        player:completeQuest(CRYSTAL_WAR, THE_TIGRESS_STIRS);
    elseif (csid == 0x0097) then
        player:addQuest(CRYSTAL_WAR, KNOT_QUITE_THERE);
    end
end;

