-----------------------------------
-- Area: Qufim Island
--  NPC: Trodden Snow
-- Mission: ASA - THAT_WHICH_CURDLES_BLOOD
-- Mission: ASA - SUGAR_COATED_DIRECTIVE
-- @zone 126
-- !pos -19 -17 104
-----------------------------------
package.loaded["scripts/zones/Qufim_Island/TextIDs"] = nil;
-------------------------------------
require("scripts/zones/Qufim_Island/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)
    -- Trade Enfeebling Kit
    if (player:getCurrentMission(ASA) == THAT_WHICH_CURDLES_BLOOD) then
    local item = 0;
    local asaStatus = player:getVar("ASA_Status");

        -- TODO: Other Enfeebling Kits
        if (asaStatus == 0) then
            item = 2779;
        else
            printf("Error: Unknown ASA Status Encountered <%u>", asaStatus);
    end

        if (trade:getItemCount() == 1 and trade:hasItemQty(item,1)) then
            player:tradeComplete();
    player:startEvent(44);
    end
    end
end;

function onTrigger(player,npc)
    --ASA 4 CS: Triggers With At Least 3 Counterseals.
    if (player:getCurrentMission(ASA) == SUGAR_COATED_DIRECTIVE) then
        local completedSeals = 0;

        if (player:hasKeyItem(dsp.ki.AMBER_COUNTERSEAL)) then
            completedSeals = completedSeals + 1;
        end;

        if (player:hasKeyItem(dsp.ki.AZURE_COUNTERSEAL)) then
            completedSeals = completedSeals + 1;
        end;

        if (player:hasKeyItem(dsp.ki.CERULEAN_COUNTERSEAL)) then
            completedSeals = completedSeals + 1;
        end;

        if (player:hasKeyItem(dsp.ki.EMERALD_COUNTERSEAL)) then
            completedSeals = completedSeals + 1;
        end;

        if (player:hasKeyItem(dsp.ki.SCARLET_COUNTERSEAL)) then
            completedSeals = completedSeals + 1;
        end;

        if (player:hasKeyItem(dsp.ki.VIOLET_COUNTERSEAL)) then
            completedSeals = completedSeals + 1;
        end;

        if (completedSeals >= 3) then
            player:setVar("ASA_Status", completedSeals);
        player:startEvent(45);
        end;
    end
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)

     if (csid==44) then
            player:addKeyItem(dsp.ki.DOMINAS_SCARLET_SEAL);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.DOMINAS_SCARLET_SEAL);
            player:addKeyItem(dsp.ki.DOMINAS_CERULEAN_SEAL);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.DOMINAS_CERULEAN_SEAL);
            player:addKeyItem(dsp.ki.DOMINAS_EMERALD_SEAL);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.DOMINAS_EMERALD_SEAL);
            player:addKeyItem(dsp.ki.DOMINAS_AMBER_SEAL);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.DOMINAS_AMBER_SEAL);
            player:addKeyItem(dsp.ki.DOMINAS_VIOLET_SEAL);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.DOMINAS_VIOLET_SEAL);
            player:addKeyItem(dsp.ki.DOMINAS_AZURE_SEAL);
            player:messageSpecial(KEYITEM_OBTAINED,dsp.ki.DOMINAS_AZURE_SEAL);

            player:completeMission(ASA,THAT_WHICH_CURDLES_BLOOD);
        player:addMission(ASA,SUGAR_COATED_DIRECTIVE);

        player:setVar("ASA_Status",0);
        player:setVar("ASA4_Amber","0");
        player:setVar("ASA4_Azure","0");
        player:setVar("ASA4_Cerulean","0");
        player:setVar("ASA4_Emerald","0");
        player:setVar("ASA4_Scarlet","0");
        player:setVar("ASA4_Violet","0");
    elseif (csid==45) then
            local completedSeals = player:getVar("ASA_Status");

        -- Calculate Reward
            if (completedSeals == 3) then
                player:addGil(GIL_RATE*3000);
            elseif (completedSeals == 4) then
                player:addGil(GIL_RATE*10000);
            elseif (completedSeals == 5) then
                player:addGil(GIL_RATE*30000);
               elseif (completedSeals == 6) then
                player:addGil(GIL_RATE*50000);
            end

        -- Clean Up Remaining Key Items
        player:delKeyItem(dsp.ki.DOMINAS_SCARLET_SEAL);
            player:delKeyItem(dsp.ki.DOMINAS_CERULEAN_SEAL);
            player:delKeyItem(dsp.ki.DOMINAS_EMERALD_SEAL);
            player:delKeyItem(dsp.ki.DOMINAS_AMBER_SEAL);
            player:delKeyItem(dsp.ki.DOMINAS_VIOLET_SEAL);
            player:delKeyItem(dsp.ki.DOMINAS_AZURE_SEAL);

            player:delKeyItem(dsp.ki.SCARLET_COUNTERSEAL);
        player:delKeyItem(dsp.ki.CERULEAN_COUNTERSEAL);
        player:delKeyItem(dsp.ki.EMERALD_COUNTERSEAL);
        player:delKeyItem(dsp.ki.AMBER_COUNTERSEAL);
        player:delKeyItem(dsp.ki.VIOLET_COUNTERSEAL);
            player:delKeyItem(dsp.ki.AZURE_COUNTERSEAL);

        -- Advance Mission
            player:completeMission(ASA,SUGAR_COATED_DIRECTIVE);
        player:addMission(ASA,ENEMY_OF_THE_EMPIRE_I);
        player:setVar("ASA_Status",0);
    end
end;