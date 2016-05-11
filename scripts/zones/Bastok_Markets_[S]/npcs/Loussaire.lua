-----------------------------------
-- Area: Bastok Markets (S) (G-10)
-- NPC:  Loussaire
-- @pos -248.677 -8.523 -125.734 87
-----------------------------------

package.loaded["scripts/zones/Bastok_Markets_[S]/TextIDs"] = nil;
require("scripts/zones/Bastok_Markets_[S]/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local mLvl          = player:getMainLvl();
    local mJob          = player:getMainJob();
    local downwardHelix = player:getQuestStatus(CRYSTAL_WAR, DOWNWARD_HELIX);

    -- Controls the progress of each step. Everything will start at 1 and end at 4 (complete).
    local loafersQuestProgress = player:getVar("AF_SCH_BOOTS");
    local pantsQuestProgress   = player:getVar("AF_SCH_PANTS");
    local gownQuestProgress    = player:getVar("AF_SCH_BODY");
    local AFProgress           = player:getVar("AF_Loussaire");

    if (player:getVar("AF_SCH_COMPLETE") == 0) then

        -- They have a piece in progress.
        if ((loafersQuestProgress == 1 or pantsQuestProgress == 1 or gownQuestProgress == 1 or
             loafersQuestProgress == 2 or pantsQuestProgress == 2 or gownQuestProgress == 2) and AFProgress > 0) then

            local itemid   = 14580; -- Scholar's Gown
            local FristKI  = PEISTE_DUNG;
            local SecondKI = SAMPLE_OF_GRAUBERG_CHERT;

            if (loafersQuestProgress == 1 or loafersQuestProgress == 2) then
                itemid   = 15748; -- Scholar's Loafers
                FristKI  = RAFFLESIA_DREAMSPIT;
                SecondKI = DROGAROGAN_BONEMEAL;

            elseif (pantsQuestProgress == 1 or pantsQuestProgress == 2) then
                itemid   = 16311; -- Scholar's Pants
                FristKI  = SLUG_MUCUS;
                SecondKI = DJINN_EMBER;
            end

            player:startEvent(50, itemid, FristKI, SecondKI);

        -- Nothing in progress and meet the starting requirements.
        elseif (downwardHelix == QUEST_COMPLETED and mJob == JOBS.SCH and mLvl >= AF2_QUEST_LEVEL) then

             -- If a player has completed any of the paths, it will be a different cutscene.
            local counter = 0;
            if (loafersQuestProgress == 4) then
                counter = counter + 1;
            end
            if (pantsQuestProgress == 4) then
                counter = counter + 1;
            end
            if (gownQuestProgress == 4) then
                counter = counter + 1;
            end

            -- Controls which CS to give the player based on completed paths.
            local cutsceneID = 51;
            if (counter == 1) then
                cutsceneID = 52;
            elseif (counter == 2) then
                cutsceneID = 54;
            end;

            -- Check Key Items and give them their dynamic event.
            if (player:hasKeyItem(RAFFLESIA_DREAMSPIT) and player:hasKeyItem(DROGAROGAN_BONEMEAL) and loafersQuestProgress == 3) then -- Scholar's Loafers
                player:startEvent(cutsceneID, 15748);
                player:setLocalVar("item", 15748);
                player:setLocalVar("firstKI", RAFFLESIA_DREAMSPIT);
                player:setLocalVar("secondKI", DROGAROGAN_BONEMEAL);

            elseif (player:hasKeyItem(SLUG_MUCUS) and player:hasKeyItem(DJINN_EMBER) and pantsQuestProgress == 3) then -- Scholar's Pants
                player:startEvent(cutsceneID, 16311);
                player:setLocalVar("item", 16311);
                player:setLocalVar("firstKI", SLUG_MUCUS);
                player:setLocalVar("secondKI", DJINN_EMBER);

            elseif (player:hasKeyItem(PEISTE_DUNG) and player:hasKeyItem(SAMPLE_OF_GRAUBERG_CHERT) and gownQuestProgress == 3) then -- Scholar's Gown
                player:startEvent(cutsceneID, 14580);
                player:setLocalVar("item", 14580);
                player:setLocalVar("firstKI", PEISTE_DUNG);
                player:setLocalVar("secondKI", SAMPLE_OF_GRAUBERG_CHERT);

            -- Show them the normal Menu to select from.
            else

                local params = 0; -- Controls which items to hide (Binary - 0XXX)

                -- Scholar's Loafers
                if (loafersQuestProgress ~= 0) then
                    params = 1;
                end

                -- Scholar's Pants
                if (pantsQuestProgress ~= 0) then
                    params = params + 2;
                end

                -- Scholar's Gown
                if (gownQuestProgress ~= 0) then
                    params = params + 4;
                end

                if (params < 8) then
                    if (AFProgress > 0) then
                        player:startEvent(53, params); -- Shorter CS than 49
                    else
                        player:startEvent(49, params);
                    end
                end
            end

        else
            player:startEvent(48); -- Default message
        end
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 49 or csid == 53) then
        -- Display Loafers
        if (option == 2) then
            player:updateEvent(option,RAFFLESIA_DREAMSPIT,DROGAROGAN_BONEMEAL,0,0,0,0,0);

        -- Display Pants
        elseif (option == 4) then
            player:updateEvent(option,SLUG_MUCUS,DJINN_EMBER,0,0,0,0,0);

        -- Display Gown
        elseif (option == 6) then
            player:updateEvent(option,PEISTE_DUNG,SAMPLE_OF_GRAUBERG_CHERT,0,0,0,0,0);

        -- Confirm Loafers
        elseif (option == 1) then
            player:setVar("AF_SCH_BOOTS", 1);

        -- Confirm Pants
        elseif (option == 3) then
            player:setVar("AF_SCH_PANTS", 1);

        -- Confirm Gown
        elseif (option == 5) then
            player:setVar("AF_SCH_BODY", 1);

        elseif (option > 7) then
            player:PrintToPlayer("There was an error in the CS. Inform your Server Admin/GM.");
        end
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);

    if (csid == 49 and option == 0) then
        player:setVar("AF_Loussaire", 1);

    elseif (csid == 51 or csid == 52 or csid == 54) then

        local itemid   = player:getLocalVar("item");
        local firstKI  = player:getLocalVar("firstKI");
        local secondKI = player:getLocalVar("secondKI");

        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, itemid);

        else
            -- Remove LocalVars
            player:setLocalVar("item", 0);
            player:setLocalVar("firstKI", 0);
            player:setLocalVar("secondKI", 0);

            -- Flag the path complete
            if (itemid == 15748) then
                player:setVar("AF_SCH_BOOTS", 4);
            elseif (itemid == 16311) then
                player:setVar("AF_SCH_PANTS", 4);
            else
                player:setVar("AF_SCH_BODY", 4);
            end

            local AFProgress = player:getVar("AF_Loussaire");
            if (AFProgress == 3) then

                -- They are done. Clean-up
                player:setVar("AF_SCH_BOOTS",    0);
                player:setVar("AF_SCH_PANTS",    0);
                player:setVar("AF_SCH_BODY",     0);
                player:setVar("AF_Loussaire",    0);
                player:setVar("AF_SCH_COMPLETE", 1);

            else
                player:setVar("AF_Loussaire", AFProgress + 1); -- They got an item. Add it!
            end

            player:delKeyItem(firstKI);
            player:delKeyItem(secondKI);
            player:messageSpecial(ITEM_OBTAINED, itemid);
            player:addItem(itemid);
        end
    end
end;
