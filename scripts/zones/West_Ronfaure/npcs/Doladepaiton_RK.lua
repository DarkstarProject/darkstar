-----------------------------------
-- Area: West Ronfaure
--  NPC: Doladepaiton, R.K.
-- Type: Outpost Conquest Guards
-- !pos -448 -19 -214 100
-------------------------------------
package.loaded["scripts/zones/West_Ronfaure/TextIDs"] = nil;
--------------------------------------

require("scripts/globals/conquest");
require("scripts/zones/West_Ronfaure/TextIDs");
require("scripts/globals/garrison");

-- Conquest
local guardnation = NATION_SANDORIA; -- SANDORIA, BASTOK, WINDURST, 4 = jeuno
local guardtype   = 3;        -- 1: city, 2: foreign, 3: outpost, 4: border
local region      = RONFAURE;
local csid        = 0x7ffb;

-- Garrison
local garrison_csid = 32753

-----------------------------------
-- onSpawn
-----------------------------------
function onSpawn(npc)
    npc:setLocalVar("GarrisonState", IDLE_GARRISON)
end

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    print("onTrade: init\n");
    local garrison_check, result = onGarrisonTrade(npc, player, trade)
    print("onTrade: item = " .. trade:getItemId() .. " result = " .. result)
    
    if (garrison_check) then
        print("onTrade: true\n")
        if (result == 1) then -- Garrison Success
            player:startEvent(garrison_csid, npc:getZoneID(), 6, npc:getCurrentRegion(), player:getStatusEffect(EFFECT_LEVEL_RESTRICTION):getPower())

        elseif (result == 2) then
            player:messageSpecial(GARRISON_WRONG_NATION, trade:getItemId(), player:getNation())

        elseif (result == 3) then
            print("onGarrisonTrade: Garrison player cooldown, cannot start.\n")
            player:showText(npc, AVERTED_BEASTMEN);

        elseif (result == 4) then
            print("onGarrisonTade: Garrison zone cooldown, cannot start.\n")
            player:showText(npc, AVERTED_BEASTMEN);
        else
            print("onTrade: butts...result fucked up.\n")
        end

    else
        print("onTrade: failed garrison trade.\n");
        tradeConquestGuard(player,npc,trade,guardnation,guardtype);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    player:showText(npc, 314)

    local garrison_check = onGarrisonTrigger(npc, player)
    if (garrison_check == 1) then -- Preparing and adding garrison member
        player:showText(npc, GARRISON_PROMPT)
    elseif (garrison_check == 2) then --Garrison end success and player was initiator
        player:showText(npc, GARRISON_SUCCESS)
    elseif (garrison_check == 3) then --Garrison end fail and player was initiator 
        player:showText(npc, GARRISON_FAIL)
    elseif (garrison_check == 4) then --Garrison end success and player was ally
        player:showText(npc, ALLY_COMPLETE)
    elseif (garrion_check == 5) then --Garrison end fail and player was ally
        player:showText(npc, ALLY_FAIL)
    elseif (garrison_check == 6) then --Garrison cooldown
        player:showText(npc, AVERTED_BEASTMEN)
        
    elseif (player:hasKeyItem(getSupplyKey(region)) and player:getNation() == guardnation) then
        if (supplyRunFresh(player) == 1) then
            player:startEvent(csid,16,0,0,0,1,0,0,255); -- you have brought us supplies !
        else
            player:showText(npc, CONQUEST - 1); -- "Hmm... These supplies you have brought us are too old to be of any use."
            player:delKeyItem(getSupplyKey(region));
            player:messageSpecial(KEYITEM_OBTAINED + 1, getSupplyKey(region));
            player:setVar("supplyQuest_region",0);
        end
    else
        local arg1 = getArg1(guardnation, player) - 1;
        if (arg1 >= 1792) then -- foreign, non-allied
            player:startEvent(csid,1808,0,0,0,0,player:getRank(),0,0);
        else -- citizen or allied
            player:startEvent(csid,arg1,0,0x3F0000,0,0,getArg6(player),0,0);
        end
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("OPTION: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("OPTION: %u",option);

    if (option == 1) then
        local duration = (player:getRank() + getNationRank(player:getNation()) + 3) * 3600;
        player:delStatusEffect(EFFECT_SIGIL);
        player:delStatusEffect(EFFECT_SANCTION);
        player:delStatusEffect(EFFECT_SIGNET);
        player:addStatusEffect(EFFECT_SIGNET,0,0,duration); -- Grant Signet
    elseif (option == 2) then
        player:delKeyItem(getSupplyKey(region));
        player:addCP(supplyReward[region + 1])
        player:messageSpecial(CONQUEST); -- "You've earned conquest points!"
        if (hasOutpost(player, region+5) == 0) then
            local supply_quests = 2^(region+5);
            player:addNationTeleport(guardnation,supply_quests);
            player:setVar("supplyQuest_region",0);
        end
    elseif (option == 4) then
        if (player:delGil(giltosetHP(guardnation,player))) then
            player:setHomePoint();
            player:messageSpecial(CONQUEST + 94); -- "Your home point has been set."
        else
            player:messageSpecial(CONQUEST + 95); -- "You do not have enough gil to set your home point here."
        end
    end

end;
