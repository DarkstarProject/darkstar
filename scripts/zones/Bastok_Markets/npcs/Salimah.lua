-----------------------------------
-- Area:  Bastok Markets
-- NPC:   Salimah
-- Notes: Start & Finishes Quest: Gourmet
-- @pos -31.687 -6.824 -73.282 235
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/settings");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    local Gourmet = player:getQuestStatus(BASTOK,GOURMET);

    if (Gourmet ~= QUEST_AVAILABLE and player:needToZone() == false) then
        local count = trade:getItemCount();
        local hasSleepshroom = trade:hasItemQty(4374,1);
        local hasTreantBulb = trade:hasItemQty(953,1);
        local hasWildOnion = trade:hasItemQty(4387,1);

        if (hasSleepshroom or hasTreantBulb or hasWildOnion) then
            if (count == 1) then
                local vanatime = VanadielHour();
                local item = 0;
                local event = 203;

                if (hasSleepshroom) then
                    item = 4374;
                    if (vanatime>=18 or vanatime<6) then
                        event = 201;
                    end
                elseif (hasTreantBulb) then
                    item = 953;
                    if (vanatime>=6 and vanatime<12) then
                        event = 201;
                    end
                elseif (hasWildOnion) then
                    item = 4387;
                    if (vanatime>=12 and vanatime<18) then
                        event = 202;
                    end
                end

                player:startEvent(event,item);
            end
        end
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:getQuestStatus(BASTOK,GOURMET) ~= QUEST_AVAILABLE and player:needToZone()) then
        player:startEvent(0x0079);
    else
        player:startEvent(0x00c8);
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

    local Gourmet = player:getQuestStatus(BASTOK,GOURMET);

    if (csid == 0x00c8) then
        if (Gourmet == QUEST_AVAILABLE) then
            player:addQuest(BASTOK,GOURMET);
        end
    elseif (csid ~= 0x0079) then
        player:tradeComplete();
        if (Gourmet == QUEST_ACCEPTED) then
            player:completeQuest(BASTOK,GOURMET);
        end

        local gil=350;
        local fame=120;
        if (csid == 201) then
            gil=200;
        elseif (csid == 203) then
            gil=100;
            fame=60;
        end

        player:addGil(gil*GIL_RATE);
        player:messageSpecial(GIL_OBTAINED,gil*GIL_RATE);
        player:addFame(BASTOK,fame);
        player:addTitle(MOMMYS_HELPER);
        player:needToZone(true);
    end
end;