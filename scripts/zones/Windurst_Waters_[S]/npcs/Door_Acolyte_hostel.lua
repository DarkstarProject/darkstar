-----------------------------------
-- Area: Windurst Waters (S)
--  NPC: Door Acolyte hostel
-- !pos 125 -2 216 94
-----------------------------------
package.loaded["scripts/zones/Windurst_Waters_[S]/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    if (player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STIRS)==QUEST_ACCEPTED and player:hasKeyItem(dsp.ki.SMALL_STARFRUIT)) then
        player:startEvent(129);
    elseif (player:getQuestStatus(CRYSTAL_WAR, THE_TIGRESS_STRIKES) == QUEST_COMPLETED and player:getQuestStatus(CRYSTAL_WAR, KNOT_QUITE_THERE) == QUEST_AVAILABLE) then
        if (player:getCurrentMission(WOTG) == CAIT_SITH or player:hasCompletedMission(WOTG, CAIT_SITH)) then
            player:startEvent(151);
        end
    elseif (player:getQuestStatus(CRYSTAL_WAR, KNOT_QUITE_THERE) == QUEST_ACCEPTED) then
        player:startEvent(152);
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    if (csid == 129) then
        player:addItem(4144); -- hi-elixir
        player:messageSpecial(ITEM_OBTAINED, 4144);
        player:delKeyItem(dsp.ki.SMALL_STARFRUIT);
        player:addKeyItem(dsp.ki.BRASS_RIBBON_OF_SERVICE);
        player:messageSpecial(KEYITEM_OBTAINED, dsp.ki.BRASS_RIBBON_OF_SERVICE);
        player:completeQuest(CRYSTAL_WAR, THE_TIGRESS_STIRS);
    elseif (csid == 151) then
        player:addQuest(CRYSTAL_WAR, KNOT_QUITE_THERE);
    end
end;

