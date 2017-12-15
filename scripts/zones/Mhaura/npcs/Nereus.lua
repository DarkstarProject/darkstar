-----------------------------------
-- Area: Mhaura
--  NPC: Nereus
-- Starts and ends repeteable quest A_POTTER_S_PREFERENCE
-----------------------------------

--     player:startEvent(110); standar dialog
--    player:startEvent(115); -- i have enough for now, come later
--    player:startEvent(114); --  get me x as soon as you can
--    player:startEvent(111); -- start quest A Potter's Preference
--    player:startEvent(113); -- quest done!
--    player:startEvent(112); -- repeat quest

function onTrade(player,npc,trade)
if ((player:getQuestStatus(OTHER_AREAS,A_POTTER_S_PREFERENCE) == QUEST_ACCEPTED) or (player:getVar("QuestAPotterPrefeRepeat_var")==1)) then
    local gusgenclay  = trade:hasItemQty(569,1);
    if (gusgenclay  == true) then
        player:startEvent(113); -- quest done!
    end;
end;
end;

function onTrigger(player,npc)

if (player:getQuestStatus(OTHER_AREAS,A_POTTER_S_PREFERENCE)==QUEST_AVAILABLE and player:getFameLevel(WINDURST)>5) then
    player:startEvent(111,569); -- start quest A Potter's Preference
elseif (player:getQuestStatus(OTHER_AREAS,A_POTTER_S_PREFERENCE)==QUEST_ACCEPTED) then
    player:startEvent(114,569); --   get me dish_of_gusgen_clay  as soon as you can
elseif (player:getQuestStatus(OTHER_AREAS,A_POTTER_S_PREFERENCE)==QUEST_COMPLETED) then
    if (player:getVar("QuestAPotterPrefeCompDay_var")+7<VanadielDayOfTheYear() or player:getVar("QuestAPotterPrefeCompYear_var")<VanadielYear()) then
    -- seven days after copletition, allow to do the quest again
        player:startEvent(112); -- repeat quest
    else
        player:startEvent(115); -- i have enough for now, come later
    end;
else
     player:startEvent(110); --standar dialog
end;

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if ((csid == 111 and option == 1)) then  --accept quest
        player:addQuest(OTHER_AREAS,A_POTTER_S_PREFERENCE);
    elseif (csid == 113) then --quest completed
        player:tradeComplete();
        player:addFame(WINDURST,120);
        player:addGil(GIL_RATE*2160);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*2160);
        player:setVar("QuestAPotterPrefeRepeat_var",0);
        player:setVar("QuestAPotterPrefeCompDay_var",VanadielDayOfTheYear());
        player:setVar("QuestAPotterPrefeCompYear_var",VanadielYear());
        player:completeQuest(OTHER_AREAS,A_POTTER_S_PREFERENCE);
    elseif (csid == 112) then --repeat quest
        player:setVar("QuestAPotterPrefeRepeat_var",1);
    end;
end;



