-----------------------------------
-- Area: North Gustaberg
--  NPC: Butsutsu, W.W.
-- Type: Border Conquest Guards
-- @pos -520.704 38.75 560.258 106
-----------------------------------
package.loaded["scripts/zones/North_Gustaberg/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/conquest");
require("scripts/zones/North_Gustaberg/TextIDs");

local guardnation = WINDURST; -- SANDORIA, BASTOK, WINDURST, 4 = jeuno
local guardtype   = 4;        -- 1: city, 2: foreign, 3: outpost, 4: border
local region      = GUSTABERG;
local csid        = 0x7ff6;

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    tradeConquestGuard(player,npc,trade,guardnation,guardtype);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    if (player:hasKeyItem(getSupplyKey(region)) and player:getNation() == guardnation) then
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