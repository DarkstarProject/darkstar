-----------------------------------
-- Area: Aht Urhgan Whitegate
--  NPC: Sanraku
-- Type: Zeni NM pop item and trophy management.
-- @pos -125.724 0.999 22.136 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/besieged");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    --[[
    local trophies =
    {
        2616, 2617, 2618, 2613, 2614, 2615, 2610, 2611, 2612,
        2609, 2626, 2627, 2628, 2623, 2624, 2625, 2620, 2621,
        2622, 2619, 2636, 2637, 2638, 2633, 2634, 2635, 2630,
        2631, 2632, 2629
    }

    local seals =
    {
        MAROON_SEAL, MAROON_SEAL, MAROON_SEAL,
        APPLE_GREEN_SEAL,APPLE_GREEN_SEAL,APPLE_GREEN_SEAL,
        CHARCOAL_GREY_SEAL, DEEP_PURPLE_SEAL, CHESTNUT_COLORED_SEAL,
        LILAC_COLORED_SEAL,
        CERISE_SEAL,CERISE_SEAL,CERISE_SEAL,
        SALMON_COLORED_SEAL,SALMON_COLORED_SEAL,SALMON_COLORED_SEAL,
        PURPLISH_GREY_SEAL, GOLD_COLORED_SEAL, COPPER_COLORED_SEAL,
        BRIGHT_BLUE_SEAL,
        PINE_GREEN_SEAL,PINE_GREEN_SEAL,PINE_GREEN_SEAL,
        AMBER_COLORED_SEAL,AMBER_COLORED_SEAL,AMBER_COLORED_SEAL,
        FALLOW_COLORED_SEAL,TAUPE_COLORED_SEAL,SIENNA_COLORED_SEAL,
        LAVENDER_COLORED_SEAL
    }

    if (trade:getItemCount() == 1) then
        if (trade:hasItemQty(2477,1)) then -- Trade Soul Plate
            zeni = math.random(1,200); -- random value since soul plates aren't implemented yet.
            player:tradeComplete();
            player:addCurrency("zeni_point", zeni);
            player:startEvent(0x038E,zeni);
        else
            znm = -1;
            found = false;

            while (znm <= 30) and not(found) do
                znm = znm + 1;
                found = trade:hasItemQty(trophies[znm + 1],1);
            end;

            if (found) then
                znm = znm + 1;

                if (player:hasKeyItem(seals[znm]) == false) then
                    player:tradeComplete();
                    player:addKeyItem(seals[znm]);
                    player:startEvent(0x0390,0,0,0,seals[znm]);
                else
                    player:messageSpecial(SANCTION + 8,seals[znm]); -- You already possess .. (not sure this is authentic)
                end
            end
        end
    end
    ]]
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    --[[
    if (player:getVar("ZeniStatus") == 0) then
        player:startEvent(0x038c);
    else
        local param = 2140136440; -- Defaut bitmask, Tier 1 ZNM Menu + don't ask option

        -- Tinnin Path
        if (player:hasKeyItem(MAROON_SEAL)) then
            param = param - 0x38; -- unlocks Tinnin path tier 2 ZNMs.
        end;
        if (player:hasKeyItem(APPLE_GREEN_SEAL)) then
            param = param - 0x1C0; -- unlocks Tinnin path tier 3 ZNMs.
        end;
        if (player:hasKeyItem(CHARCOAL_GREY_SEAL) and player:hasKeyItem(DEEP_PURPLE_SEAL) and player:hasKeyItem(CHESTNUT_COLORED_SEAL)) then
            param = param - 0x200; -- unlocks Tinnin.
        end;

        -- Sarameya Path
        if (player:hasKeyItem(CERISE_SEAL)) then
            param = param - 0xE000; -- unlocks Sarameya path tier 2 ZNMs.
        end;
        if (player:hasKeyItem(SALMON_COLORED_SEAL)) then
            param = param - 0x70000; -- unlocks Sarameya path tier 3 ZNMs.
        end;
        if (player:hasKeyItem(PURPLISH_GREY_SEAL) and player:hasKeyItem(GOLD_COLORED_SEAL) and player:hasKeyItem(COPPER_COLORED_SEAL)) then
            param = param - 0x80000; -- unlocks Sarameya.
        end;

        -- Tyger Path
        if (player:hasKeyItem(PINE_GREEN_SEAL)) then
            param = param - 0x3800000; -- unlocks Tyger path tier 2 ZNMs.
        end;
        if (player:hasKeyItem(AMBER_COLORED_SEAL)) then
            param = param - 0x1C000000; -- unlocks Tyger path tier 3 ZNMs.
        end;
        if (player:hasKeyItem(TAUPE_COLORED_SEAL) and player:hasKeyItem(FALLOW_COLORED_SEAL) and player:hasKeyItem(SIENNA_COLORED_SEAL)) then
            param = param - 0x20000000; -- unlocks Tyger.
        end;

        if (player:hasKeyItem(LILAC_COLORED_SEAL) and player:hasKeyItem(BRIGHT_BLUE_SEAL) and player:hasKeyItem(LAVENDER_COLORED_SEAL)) then
            param = param - 0x40000000; -- unlocks Pandemonium Warden.
        end;

        player:startEvent(0x038D,param);
    end
    ]]
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("updateRESULT: %u",option);
    --[[
    local lures =
    {
        2580, 2581, 2582, 2577, 2578, 2579, 2574, 2575, 2576,
        2573, 2590, 2591, 2592, 2587, 2588, 2589, 2584, 2585,
        2586, 2583, 2600, 2601, 2602, 2597, 2598, 2599, 2594,
        2595, 2596, 2593, 2572
    }

    local seals =
    {
        MAROON_SEAL, MAROON_SEAL, MAROON_SEAL,
        APPLE_GREEN_SEAL,APPLE_GREEN_SEAL,APPLE_GREEN_SEAL,
        CHARCOAL_GREY_SEAL, DEEP_PURPLE_SEAL, CHESTNUT_COLORED_SEAL,
        LILAC_COLORED_SEAL,
        CERISE_SEAL,CERISE_SEAL,CERISE_SEAL,
        SALMON_COLORED_SEAL,SALMON_COLORED_SEAL,SALMON_COLORED_SEAL,
        PURPLISH_GREY_SEAL, GOLD_COLORED_SEAL, COPPER_COLORED_SEAL,
        BRIGHT_BLUE_SEAL,
        PINE_GREEN_SEAL,PINE_GREEN_SEAL,PINE_GREEN_SEAL,
        AMBER_COLORED_SEAL,AMBER_COLORED_SEAL,AMBER_COLORED_SEAL,
        FALLOW_COLORED_SEAL,TAUPE_COLORED_SEAL,SIENNA_COLORED_SEAL,
        LAVENDER_COLORED_SEAL
    }

    if (csid == 0x038D) then
        local zeni = player:getCurrency("zeni_point");

        if (option >= 300 and option <= 302) then
            if (option == 300) then
                salt = SICKLEMOON_SALT;
            elseif (option == 301) then
                salt = SILVER_SEA_SALT;
            elseif (option == 302) then
                salt = CYAN_DEEP_SALT
            end;
            if (zeni < 500) then
                player:updateEvent(2,500); -- not enough zeni
            elseif (player:hasKeyItem(salt)) then
                player:updateEvent(3,500); -- has salt already
            else
                player:updateEvent(1,500,0,salt);
                player:addKeyItem(salt);
                player:delCurrency("zeni_point", 500);
            end
        else -- player is interested in buying a pop item.
            n = option % 10;

            if (n <= 2) then
                if (option == 130 or option == 440) then
                    tier = 5;
                else
                    tier = 1;
                end;
            elseif (n >= 3 and n <= 5) then
                tier = 2;
            elseif (n >= 6 and n <= 8) then
                tier = 3;
            else
                tier = 4;
            end

            cost = tier * 1000; -- static pricing for now.

            if (option >= 100 and option <= 130) then
                player:updateEvent(0,0,0,0,0,0,cost);
            elseif (option >= 400 and option <=440) then
                if (option == 440) then
                    option = 430;
                end

                item = lures[option-399]

                if (option == 430) then -- Pandemonium Warden
                    keyitem1 = LILAC_COLORED_SEAL; keyitem2 = BRIGHT_BLUE_SEAL; keyitem3 = LAVENDER_COLORED_SEAL;
                elseif (option == 409) then -- Tinnin
                    keyitem1 = CHARCOAL_GREY_SEAL; keyitem2 = DEEP_PURPLE_SEAL; keyitem3 = CHESTNUT_COLORED_SEAL;
                elseif (option == 419) then -- Sarameya
                    keyitem1 = PURPLISH_GREY_SEAL; keyitem2 = GOLD_COLORED_SEAL; keyitem3 = COPPER_COLORED_SEAL;
                elseif (option == 429) then -- Tyger
                    keyitem1 = TAUPE_COLORED_SEAL; keyitem2 = FALLOW_COLORED_SEAL; keyitem3 = SIENNA_COLORED_SEAL;
                else
                    keyitem1 = seals[option - 402]; keyitem2 = nil; keyitem3 = nil;
                end
                if (cost > zeni) then
                    player:updateEvent(2, cost, item, keyitem1,keyitem2,keyitem3); -- you don't have enough zeni.
                elseif (player:addItem(item)) then
                    if (keyitem1 ~= nil) then
                        player:delKeyItem(keyitem1);
                    end
                    if (keyitem2 ~= nil) then
                        player:delKeyItem(keyitem2);
                    end
                    if (keyitem3 ~= nil) then
                        player:delKeyItem(keyitem3);
                    end

                    player:updateEvent(1, cost, item, keyitem1,keyitem2,keyitem3);
                    player:delCurrency("zeni_point", cost);
                else
                    player:updateEvent(4, cost, item, keyitem1,keyitem2,keyitem3); -- Cannot obtain.
                end
            elseif (option == 500) then -- player has declined to buy a pop item
                player:updateEvent(1,1); -- restore the "Gaining access to the islets" option.
            else
                -- print("onEventSelection - CSID:",csid);
                -- print("onEventSelection - option ===",option);
            end
        end
    end
    ]]
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("finishRESULT: %u",option);
    --[[
    if (csid == 0x038c) then
        player:setVar("ZeniStatus",1);
        player:addCurrency("zeni_point", 2000);
    end
    ]]
end;