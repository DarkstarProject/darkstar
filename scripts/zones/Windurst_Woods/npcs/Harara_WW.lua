-----------------------------------
--    Area: Windurst Woods
--    NPC:  Harara, W.W.

-- X Grant Signet
-- X Recharge Emperor Band, Empress Band, or Chariot Band
-- X Accepts traded Crystals to fill up the Rank bar to open new Missions.
-- X Sells items in exchange for Conquest Points
-- X Start Supply Run Missions and offers a list of already-delivered supplies.
--   Start an Expeditionary Force by giving an E.F. region insignia to you.
-------------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
-------------------------------------

require("scripts/globals/conquest");
require("scripts/globals/common");
require("scripts/zones/Windurst_Woods/TextIDs");

local guardnation = WINDURST; -- SANDORIA, BASTOK, WINDURST, JEUNO
local guardtype   = 1;        -- 1: city, 2: foreign, 3: outpost, 4: border
local size      = table.getn(WindInv);
local inventory = WindInv;

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

    if (player:getNation() == guardnation and player:getVar("supplyQuest_started") > 0 and supplyRunFresh(player) == 0) then
        player:showText(npc,CONQUEST + 40); -- "We will dispose of those unusable supplies."
        local region = player:getVar("supplyQuest_region");
        player:delKeyItem(getSupplyKey(region));
        player:messageSpecial(KEYITEM_OBTAINED + 1,getSupplyKey(region));
        player:setVar("supplyQuest_started",0);
        player:setVar("supplyQuest_region",0);
        player:setVar("supplyQuest_fresh",0);
    else
        Menu1 = getArg1(guardnation,player);
        Menu2 = getExForceAvailable(guardnation,player);
        Menu3 = conquestRanking();
        Menu4 = getSupplyAvailable(guardnation,player);
        Menu5 = player:getNationTeleport(guardnation);
        Menu6 = getArg6(player);
        Menu7 = player:getCP();
        Menu8 = getRewardExForce(guardnation,player);

        player:startEvent(0x7ff7,Menu1,Menu2,Menu3,Menu4,Menu5,Menu6,Menu7,Menu8);
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("onUpdateCSID: %u",csid);
    -- printf("onUpdateOPTION: %u",option);

    if (option >= 32768 and option <= 32944) then
        for Item = 1,size,3 do
            if (option == inventory[Item]) then
                CPVerify = 1;
                if (player:getCP() >= inventory[Item + 1]) then
                    CPVerify = 0;
                end;

                player:updateEvent(2,CPVerify,inventory[Item + 2]);
                break;
            end;
        end;
    end;

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("onFinishCSID: %u",csid);
    -- printf("onFinishOPTION: %u",option);

    if (option == 1) then
        duration = (player:getRank() + getNationRank(player:getNation()) + 3) * 3600;
        player:delStatusEffect(EFFECT_SIGIL);
        player:delStatusEffect(EFFECT_SANCTION);
        player:delStatusEffect(EFFECT_SIGNET);
        player:addStatusEffect(EFFECT_SIGNET,0,0,duration); -- Grant Signet
    elseif (option >= 32768 and option <= 32944) then
        for Item = 1,size,3 do
            if (option == inventory[Item]) then
                if (player:getFreeSlotsCount() >= 1) then
                    -- Logic to impose limits on exp bands
                    if (option >= 32933 and option <= 32935) then
                        if (checkConquestRing(player) > 0) then
                            player:messageSpecial(CONQUEST+60,0,0,inventory[Item+2]);
                            break;
                        else
                            player:setVar("CONQUEST_RING_TIMER",getConquestTally());
                        end
                    end

                    if (player:getNation() == guardnation) then
                        itemCP = inventory[Item + 1];
                    else
                        if (inventory[Item + 1] <= 8000) then
                            itemCP = inventory[Item + 1] * 2;
                        else
                            itemCP = inventory[Item + 1] + 8000;
                        end;
                    end;

                    if (player:hasItem(inventory[Item + 2]) == false) then
                        player:delCP(itemCP);
                        player:addItem(inventory[Item + 2],1);
                        player:messageSpecial(ITEM_OBTAINED,inventory[Item + 2]);
                    else
                        player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,inventory[Item + 2]);
                    end;
                else
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,inventory[Item + 2]);
                end;
                break;
            end;
        end;
    elseif (option >= 65541 and option <= 65565) then -- player chose supply quest.
        local region = option - 65541;
        player:addKeyItem(getSupplyKey(region));
        player:messageSpecial(KEYITEM_OBTAINED,getSupplyKey(region));
        player:setVar("supplyQuest_started",vanaDay());
        player:setVar("supplyQuest_region",region);
        player:setVar("supplyQuest_fresh",getConquestTally());
    end;

end;