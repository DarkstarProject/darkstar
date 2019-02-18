-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Deraquien
-- Involved in Quest: Lure of the Wildcat (San d'Oria)
-- Involved in Quest: A Timely Visit
-- !pos -98 -2 31 230
-------------------------------------
local ID = require("scripts/zones/Southern_San_dOria/IDs")
require("scripts/globals/keyitems")
require("scripts/globals/quests")
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA, FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart_flyer
            player:messageSpecial(ID.text.FLYER_REFUSED)
        end
    end

end

function onTrigger(player,npc)

    local WildcatSandy = player:getVar("WildcatSandy")
    local aTimelyVisit = player:getQuestStatus(SANDORIA, A_TIMELY_VISIT)
    local lureOfTheWildcat = player:getQuestStatus(SANDORIA, LURE_OF_THE_WILDCAT_SAN_D_ORIA)

    if lureOfTheWildcat == QUEST_ACCEPTED and player:getMaskBit(WildcatSandy, 4) == false then
        player:startEvent(811)
    elseif aTimelyVisit ~= QUEST_COMPLETE then
        local canAccessChateau = true -- TODO: Change to false after testing
        local rankLevel = player:getRank()

        if player:getNation() == NATION_SANDORIA and rankLevel >= 2 then
            canAccessChateau = true
        elseif rankLevel >= 3 then
            canAccessChateau = true
        end

        --https://www.youtube.com/watch?v=HxPwXHfe-3c 9:49 -> 13:20
        -- ADVENTURERS_CERTIFICATE = can enter Chateau d'Oraguille
        if canAccessChateau and player:getFameLevel(SANDORIA) >= 3 and player:hasKeyItem(dsp.ki.ADVENTURERS_CERTIFICATE) then
            local aTimelyVisitStep = player:getVar("aTimelyVisitStep")

            if aTimelyVisitStep == 0 then
                player:startEvent(33) -- initial cs for the quest - thief of royal scepter
            elseif aTimelyVisitStep == 1 then
                if aTimelyVisit == QUEST_ACCEPTED then
                    player:startEvent(34) -- reminder to see Narvecaint - reminder of thief in la theine
                else
                    player:startEvent(47) -- shortened initial cs for the quest
                end
            elseif aTimelyVisitStep == 2 then
                player:startEvent(80) -- see Halver - thief caught but phillone was there
            elseif aTimelyVisitStep == 3 then
                player:startEvent(20) -- reminder to see Halver - go get reward for thief
            elseif aTimelyVisitStep == 4 then
                player:startEvent(87) -- vijartal shows up and derq tells you go talk to phillone
            elseif aTimelyVisitStep == 5 then
                player:startEvent(30) -- reminder to see Phillone
            elseif aTimelyVisitStep == 6 then
                player:startEvent(38) -- go to Jugner Forest to retrieve royal sceptre
            elseif aTimelyVisitStep >= 7 or aTimelyVisitStep <= 11 then
                player:startEvent(27) -- the lady wanst involved in the theft :(
            else                
                player:startEvent(18)
            end
        else
            player:startEvent(18) -- initial dialog
        end
    elseif lureOfTheWildcat == QUEST_COMPLETE and aTimelyVisit == QUEST_COMPLETE then
        player:startEvent(654) -- nothing to report
    else
        player:startEvent(18) -- initial dialog
    end

end

function onEventUpdate(player, csid, option)

    --printf("onEventUpdate CSID: %u", csid)
    --printf("onEventUpdate OPTION: %u", option)

end

function onEventFinish(player, csid, option)

    --printf("onEventFinish CSID: %u", csid)
    --printf("onEventFinish OPTION: %u", option)

    if csid == 811 then
        player:setMaskBit(player:getVar("WildcatSandy"), "WildcatSandy", 4, true)
    elseif csid == 33 then
        if option == 1 then
            player:setVar("aTimelyVisitStep", 1)
            player:addQuest(SANDORIA, A_TIMELY_VISIT)
        else
            player:setVar("aTimelyVisitStep", 1)
        end
    elseif csid == 47 then
        if option == 1 then
            player:addQuest(SANDORIA, A_TIMELY_VISIT)
        -- Enable the ability to rewatch initial cutscene if the player hasn't progressed the quest for a long time?
        --else
        --    player:setVar("aTimelyVisitStep", 0)
        end
    elseif csid == 80 then
        player:setVar("aTimelyVisitStep", 3)
    elseif csid == 87 then
        player:setVar("aTimelyVisitStep", 5)
    elseif csid == 38 then
        player:setVar("aTimelyVisitStep", 7)
    end

end
