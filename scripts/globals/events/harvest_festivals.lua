---------------------------------------------------------
---------------------------------------------------------
------------    Harvest Festivals    --------------------
---------------------------------------------------------
---------------------------------------------------------

require("scripts/globals/status");
require("scripts/globals/settings");

---------------------------------------------------------
---------------------------------------------------------


function isHalloweenEnabled()
    local option = 0;
    local month = tonumber(os.date("%m"));
    local day = tonumber(os.date("%d"));
    if (month == 10 and day >= 20 or month == 11 and day == 1 or HALLOWEEN_YEAR_ROUND ~= 0) then -- According to wiki Harvest Fest is Oct 20 - Nov 1.
        if (HALLOWEEN_2005 == 1) then
            option = 1;
        elseif (HALLOWEEN_2008 == 1) then
            option = 2;
        elseif (HALLOWEEN_2009 == 1) then
            option = 3;
        elseif (HALLOWEEN_2010 == 1) then
            option = 4;        
        end
    end
    return option;
end;


function halloweenItemsCheck(player)
    local headSlot = player:getEquipID(SLOT_HEAD);
    local mainHand = player:getEquipID(SLOT_MAIN);
    local reward = 0;
    
    -- Normal Quality Rewards
    local pumpkinHead = 13916
    local pumpkinHead2 = 15176;
    local trickStaff = 17565;
    local trickStaff2 = 17587;
    
    reward_list = {pumpkinHead,pumpkinHead2,trickStaff,trickStaff2};

    -- Checks for HQ Upgrade
    for ri = 1, table.getn(reward_list) do
        if (headSlot == reward_list[ri] or mainHand == reward_list[ri]) then
            if (headSlot == pumpkinHead and player:hasItem(13917) == false) then
                reward = 13917; -- Horror Head
            elseif (headSlot == pumpkinHead2 and player:hasItem(15177) == false) then
                reward = 15177; -- Horror Head II
            elseif (mainHand == trickStaff and player:hasItem(17566) == false) then
                reward =  17566; -- Treat Staff
            elseif (mainHand == trickStaff2 and player:hasItem(17588) == false) then
                reward = 17588; -- Treat Staff II
            end
            return reward;
        end
    end
    
    -- Checks the possible item rewards to ensure player doesnt already have the item we are about to give them
    local cnt = table.getn(reward_list);

    while cnt ~= 0 do
        local picked = reward_list[math.random(1,table.getn(reward_list))];
        if (player:hasItem(picked) == false) then
            reward = picked;
            cnt = 0;
        else
            table.remove(reward_list,picked);
            cnt = cnt - 1;
        end
    return reward;
    end;
end;

function onHalloweenTrade(player,trade,npc)
    local zone = player:getZoneName();
    local TextIDs = "scripts/zones/" .. zone .. "/TextIDs";
    package.loaded[TextIDs] = nil;
    require(TextIDs);
    
    local contentEnabled = isHalloweenEnabled();
    local item = trade:getItem();
    -------------------
    -- 2005 edition ---
    -------------------
    if (contentEnabled == 1) then
        -----------------------------------
        -- Treats allowed
        -----------------------------------
        treats_table = {4510, -- Acorn Cookie
                      5646, -- Bloody Chocolate
                      4496, -- Bubble Chocolate
                      4397, -- Cinna-cookie
                      4394, -- Ginger Cookie
                      4495, -- Goblin Chocolate
                      4413, -- Apple Pie
                      4488, -- Jack-o'-Pie
                      4421, -- Melon Pie
                      4563, -- Pamama Tart
                      4446, -- Pumpkin Pie
                      4414, -- Rolanberry Pie
                      4406, -- Baked Apple
                      5729, -- Bavarois
                      5745, -- Cherry Bavarois
                      5653, -- Cherry Muffin
                      5655, -- Coffee Muffin
                      5718, -- Cream Puff
                      5144, -- Crimson Jelly
                      5681, -- Cupid Chocolate
                      5672, -- Dried Berry
                      5567, -- Dried Date
                      4556, -- Icecap Rolanberry
                      5614, -- Konigskuchen
                      5230, -- Love Chocolate
                      4502, -- Marron Glace
                      4393, -- Orange Kuchen
                      5147, -- Snoll Gelato
                      4270, -- Sweet Rice Cake
                      5645, -- Witch Nougat
                      5552, -- Black Pudding  --safe
                      5550, -- Buche au Chocolat -- safe @ 43 items
                      5616, -- Lebkuchen House --breaks
                      5633, -- Chocolate Cake
                      5542, -- Gateau aux Fraises
                      5572, -- Irmik Helvasi
                      5625, -- Maple Cake
                      5559, -- Mille Feuille
                      5557, -- Mont Blanc
                      5629, -- Orange Cake
                      5631, -- Pumpkin Cake
                      5577, -- Sutlac
                      5627}; -- Yogurt Cake

        for itemInList = 1, table.getn(treats_table)  do

            if (item == treats_table[itemInList]) then
                local itemReward = halloweenItemsCheck(player);
                local varName = "harvestFestTreats";
                local harvestFestTreats;
                if (itemInList < 32) then -- The size of the list is too big for int 32 used that stores the bit mask, as such there are two lists

                    harvestFestTreats = player:getVar(varName); 
                else

                    varName = "harvestFestTreats2";
                    harvestFestTreats = player:getVar(varName); --  this is the second list
                    itemInList = itemInList - 32;
                end
                
                local AlreadyTradedChk = player:getMaskBit(harvestFestTreats,itemInList);
                if (itemReward ~= 0 and player:getFreeSlotsCount() >= 1 and math.random(1,3) < 2) then -- Math.random added so you have 33% chance on getting item

                    player:messageSpecial(HERE_TAKE_THIS);
                    player:addItem(itemReward);
                    player:messageSpecial(ITEM_OBTAINED,itemReward);

                elseif (player:canUseCostume() and AlreadyTradedChk == false) then
                -- Other neat looking halloween type costumes
                -- two dragon skins: @420/421
                -- @422 dancing weapon
                -- @ 433/432 golem
                -- 265 dark eye, 266 Giant version
                -- 290 dark bombs
                -- 301 dark mandy 
                -- 313 black spiders
                -- 488 gob
                -- 531 - 548 shade
                -- 564/579 skele
                    
                    -- Possible costume values:
                    Yagudo = math.random(580,607);
                    Quadav = math.random(644,671);
                    Shade = math.random(535,538);
                    Orc = math.random(612,639);
                    Ghost = 368;
                    Hound = 365;
                    Skeleton = 564;
                    Dark_Stalker = math.random(531,534);
                    
                    halloween_costume_list = {Quadav,Orc,Yagudo,Shade,Ghost,Hound,Skeleton,Dark_Stalker}; 

                    local costumePicked = halloween_costume_list[math.random(1,table.getn(halloween_costume_list))]; -- will randomly pick one of the costumes in the list
                    player:addStatusEffect(EFFECT_COSTUME,costumePicked,0,3600);

                    -- pitchForkCostumeList defines the special costumes per zone that can trigger the pitch fork requirement
                    -- zone, costumeID
                    pitchForkCostumeList = {234,Shade,Skeleton, -- Bastok mines 
                                            235,Hound,Ghost,      -- Bastok Markets
                                            230,Ghost,Skeleton, -- Southern Sandoria
                                            231,Hound,Skeleton,   -- Northern Sandoria
                                            241,Ghost,Shade,    -- Windurst Woods
                                            238,Shade,Hound};     -- Windurst Woods

                    for zi = 1, table.getn(pitchForkCostumeList), 3 do

                        if (zone == pitchForkCostumeList[zi] and (costumePicked == pitchForkCostumeList[zi + 1] or zone == pitchForkCostumeList[zi] and costumePicked == pitchForkCostumeList[zi + 2])) then -- Gives special hint for pitch fork costume
                            player:messageSpecial(IF_YOU_WEAR_THIS);

                        elseif (zi == 16) then
                            player:messageSpecial(THANK_YOU_TREAT);    

                        end

                    end
                else
                    player:messageSpecial(THANK_YOU);
                end
                
                if (AlreadyTradedChk == false) then
                    player:setMaskBit(harvestFestTreats,varName,itemInList,true);
                end
                
                player:tradeComplete();
                
                break;
            end
        end
    end
end;

function applyHalloweenNpcCostumes(zoneid)

    if (isHalloweenEnabled() ~= 0) then
        -- npcID, skinID (skin ID can be found in mob_change_skin Sql table)
        local npc_costume_map = {
            [234] = {
                [17735787] = 40, -- Proud_Beard - Bastok Mines
                [17735742] = 41, -- Faustin - Bastok Mines
                [17814119] = 42, -- Aulavia - Bastok Mines
                [17735744] = 43, -- Mille - Bastok Mines
                [17735810] = 44  -- Emaliveulaux - Bastok Mines
            },
            [235] = {
                [17739805] = 45  -- Olwyn - Bastok Markets
            },
            [230] = {
                [17719306] = 46, -- Apairemant - Southern Sandoria
                [17719303] = 47, -- Machielle - Southern Sandoria
                [17719305] = 48, -- Phamelise - Southern Sandoria
                [17719485] = 49, -- Pourette - Southern Sandoria
                [17719304] = 50  -- Corua -- Southern Sandoria
            },
            [231] = {
                [17723497] = 51, -- Attarena - Northern Sandoria
                [17723492] = 52, -- Antonian - Northern Sandoria
                [17723487] = 53  -- Vichuel - Northern Sandoria
            },
            [241] = {
                [17764401] = 54, -- Kuzah_Hpirohpon - Windurst Woods
                [17764400] = 55, -- Meriri - Windurst Woods
                [17764464] = 56, -- Nhobi_Zalkia - Windurst Woods
                [17764465] = 57, -- Millerovieunet - Windurst Woods
                [17764462] = 58  -- Taraihi-Perunhi - Windurst Woods
            },
            [238] = {
                [17752101] = 59, -- Ness_Rugetomal - Windurst Waters
                [17752098] = 60, -- Upih_Khachla - Windurst Waters
                [17752097] = 61, -- Ensasa - Windurst Waters
                [17752103] = 62, -- Ahyeekih - Windurst Waters
                [17752102] = 63  -- Maqu_Molpih - Windurst Waters
            }
        };
        
        for id,skin in pairs(npc_costume_map[zoneid]) do
            local hfNpc = GetNPCByID(id);
            if (hfNpc ~= nil) then
                hfNpc:changeSkin(skin);
            end
        end
        
    end
end;



