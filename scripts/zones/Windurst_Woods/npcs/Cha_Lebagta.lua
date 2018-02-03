-----------------------------------
-- Area: Windurst Woods
--  NPC: Cha Lebagta
-- Type: Standard NPC
--  @zone 241
-- !pos 58.385 -6.249 216.670
--    Involved in Quests: As Thick as Thieves, Mihgo's Amigo
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    MihgosAmigo = player:getQuestStatus(WINDURST,MIHGO_S_AMIGO);
    thickAsThieves = player:getQuestStatus(WINDURST,AS_THICK_AS_THIEVES);
    thickAsThievesCS = player:getVar("thickAsThievesCS");

    -- As Thick As Thieves (THF AF)
    if (thickAsThieves == QUEST_ACCEPTED) then
        player:startEvent(507,0,17474);
            if (thickAsThievesCS == 1) then
                player:setVar("thickAsThievesCS",3);
            elseif (thickAsThievesCS == 2) then
                player:setVar("thickAsThievesCS",4);
                rand1 = math.random(2,7);
                player:setVar("thickAsThievesGrapplingCS",rand1);
                player:setVar("thickAsThievesGamblingCS",1);
            end

    -- Mihgo's Amigo
    elseif (MihgosAmigo == QUEST_ACCEPTED) then
        player:startEvent(85,0,498);        -- hint dialog

    -- standard dialog
    elseif (MihgosAmigo == QUEST_COMPLETED) then
        player:startEvent(91,0,498)         -- new standard dialog after Mihgo's Amigo
    else
        player:startEvent(78);                -- normal dialog
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

