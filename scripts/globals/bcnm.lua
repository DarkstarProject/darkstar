require("scripts/globals/status")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/quests")

-- NEW SYSTEM BCNM NOTES
-- The "core" functions TradeBCNM EventUpdateBCNM EventTriggerBCNM EventFinishBCNM all return TRUE if the action performed is covered by the function.
-- This means all the old code will still be executed if the new functions don't support it. This means that there is effectively 'backwards compatibility' with the old system.

-- array to map (for each zone) the item id of the valid trade item with the bcnmid in the database
-- e.g. zone, {itemid, bcnmid, itemid, bcnmid, itemid, bcnmid}
-- DO NOT INCLUDE MAAT FIGHTS
itemid_bcnmid_map =
{
    6,   {0, 0}, -- Bearclaw_Pinnacle
    8,   {0, 0}, -- Boneyard_Gully
    10,  {0, 0}, -- The_Shrouded_Maw
    13,  {0, 0}, -- Mine_Shaft_2716
    17,  {0, 0}, -- Spire of Holla
    19,  {0, 0}, -- Spire of Dem
    21,  {0, 0}, -- Spire of Mea
    23,  {0, 0}, -- Spire of Vahzl
    29,  {0, 0}, -- Riverne Site #B01
    31,  {0, 0}, -- Monarch Linn
    32,  {0, 0}, -- Sealion's Den
    35,  {0, 0}, -- The Garden of RuHmet
    36,  {0, 0}, -- Empyreal Paradox
    57,  {0, 0}, -- Talacca Cove
    64,  {0, 0}, -- Navukgo Execution Chamber
    67,  {0, 0}, -- Jade Sepulcher
    139, {1177, 4, 1552, 10, 1553, 11, 1131, 12, 1175, 15, 1180, 17}, -- Horlais Peak
    140, {1551, 34, 1552, 35, 1552, 36}, -- Ghelsba Outpost
    144, {1166, 68, 1178, 81, 1553, 76, 1180, 82, 1130, 79, 1552, 73}, -- Waughroon Shrine
    146, {1553, 107, 1551, 105, 1177, 100}, -- Balgas Dias
    163, {1130, 129, 1130, 130}, -- Sacrificial Chamber
    168, {0, 0}, -- Chamber of Oracles
    170, {0, 0}, -- Full Moon Fountain
    180, {1550, 293}, -- LaLoff Amphitheater
    181, {0, 0}, -- The Celestial Nexus
    201, {1546, 418, 1174, 417}, -- Cloister of Gales
    202, {1548, 450, 1172, 449}, -- Cloister of Storms
    203, {1545, 482, 1171, 481}, -- Cloister of Frost
    206, {0, 0}, -- Qu'Bia Arena
    207, {1544, 545}, -- Cloister of Flames
    209, {1547, 578, 1169, 577}, -- Cloister of Tremors
    211, {1549, 609} -- Cloister of Tides
}

-- [zoneId] = {bcnm, ids, in, order}
battlefield_bitmask_map =
{
    [6] = {640, 641, 642, 643, 644},
    [8] = {672, 673, 674, 675, 676, 677, 678, 679},
    [10] = {704, 705, 706},
    [13] = {736, 737, 738, 739, 740, 741},
    [17] = {768, 769, 770},
    [19] = {800,801,802},
    [21] = {832,833,834},
    [23] = {864,865,866},
    [29] = {896,897},
    [30] = {928},
    [31] = {960,961,962,963,964,965,966,967},
    [32] = {992,993},
    [35] = {1024},
    [36] = {1056,1057},
    [37] = {1298,1299,1300,1301,1302,1303,1304,1305,1306,1307},
    [38] = {1290,1291,1292,1293,1294,1295,1296,1297},
    [39] = {1286},
    [40] = {1287},
    [41] = {1288},
    [42] = {1289},
    [57] = {1088,1089,1090,1091,1092},
    [64] = {1120,1121,1122,1123,1124},
    [67] = {1152,1153,1154,1155,1156},
    [78] = {1184},
    [186] = {1280},
    [185] = {1281},
    [187] = {1282},
    [188] = {1283},
    [134] = {1284},
    [135] = {1285},
    [139] = {0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20},
    [140] = {32,33,34,35,36,37},
    [144] = {64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85},
    [146] = {96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116},
    [156] = {352,353,354},
    [163] = {128,129,130,131,132},
    [165] = {160,161,162,163,164},
    [168] = {192,193,194,195,196,197,198,199,200,201},
    [170] = {224,225,226,227},
    [179] = {256,257,258,259,260,261,262},
    [180] = {288,289,290,291,292,293},
    [181] = {320},
    [182] = {385},
    [201] = {416,417,418,419,420},
    [202] = {448,449,450,451,452},
    [203] = {480,481,482,483,484},
    [206] = {512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533},
    [207] = {544,545,546,547},
    [209] = {576,577,578,579,580},
    [211] = {608,609,610,611},
};

-- Call this onTrade for burning circles
function TradeBCNM(player, zone, trade, npc)
    if (trade == nil) then
        print("TradeBCNM was sent a nil trade!\n\t Player: "..player:getName().."\n\t zone: "..zone.."\n")
        return false
    end

    if (player:hasStatusEffect(EFFECT_BATTLEFIELD)) then -- cant start a new bc
        player:messageBasic(94, 0, 0)
        return false
    elseif (player:hasWornItem(trade:getItemId())) then -- If already used orb or testimony
        player:messageBasic(56, 0, 0) -- i need correct dialog
        return false
    end

    if (CheckMaatFights(player, zone, trade, npc)) then -- This function returns true for maat fights
        return true
    end
    -- the following is for orb battles, etc

    local id = ItemToBCNMID(player, zone, trade)

    if (id == -1) then -- no valid BCNMs with this item
        -- todo: display message based on zone text offset
        player:setVar("trade_bcnmid", 0)
        player:setVar("trade_itemid", 0)
        return false
    else -- a valid BCNM with this item, start it.
        mask = GetBattleBitmask(id, zone, 1)

        if (mask == -1) then -- Cannot resolve this BCNMID to an event number, edit bcnmid_param_map!
            print("Item is for a valid BCNM but cannot find the event parameter to display to client.")
            player:setVar("trade_bcnmid", 0)
            player:setVar("trade_itemid", 0)
            return false
        end
        if (player:isBcnmsFull() == 1) then -- temp measure, this will precheck the instances
            print("all bcnm instances are currently occupied.")
            npc:messageBasic(246, 0, 0) -- this wont look right in other languages!
            return true
        end
        player:startEvent(0x7d00, 0, 0, 0, mask, 0, 0, 0, 0)
        return true
    end
end

function EventTriggerBCNM(player, npc)
    player:setVar("trade_bcnmid", 0)
    player:setVar("trade_itemid", 0)

    if (player:hasStatusEffect(EFFECT_BATTLEFIELD)) then
        if (player:isInBcnm() == 1) then
            player:startEvent(0x7d03) -- Run Away or Stay menu
        else -- You're not in the BCNM but you have the Battlefield effect. Think: non-trader in a party
            status = player:getStatusEffect(EFFECT_BATTLEFIELD)
            playerbcnmid = status:getPower()
            playermask = GetBattleBitmask(playerbcnmid, player:getZoneID(), 1)
            if (playermask~=-1) then
                -- This gives players who did not trade to go in the option of entering the fight
                player:startEvent(0x7d00, 0, 0, 0, playermask, 0, 0, 0, 0)
            else
                player:messageBasic(94, 0, 0)
            end
        end
        return true
    else
        if (checkNonTradeBCNM(player, npc)) then
            return true
        end
    end

    return false
end

function EventUpdateBCNM(player, csid, option, entrance)
    -- return false
    local id = player:getVar("trade_bcnmid") -- this is 0 if the bcnm isnt handled by new functions
    local skip = CutsceneSkip(player, npc)

    print("UPDATE csid "..csid.." option "..option)
    -- seen: option 2, 3, 0 in that order
    if (csid == 0x7d03 and option == 2) then -- leaving a BCNM the player is currently in.
        player:updateEvent(3)
        return true
    elseif (csid == 0x7d03 and option == 3) then -- leaving a BCNM the player is currently in.
        player:updateEvent(0)
        return true
    end
    if (option == 255 and csid == 0x7d00) then -- Clicked yes, try to register bcnmid
        if (player:hasStatusEffect(EFFECT_BATTLEFIELD)) then
            -- You're entering a bcnm but you already had the battlefield effect, so you want to go to the
            -- instance that your battlefield effect represents.
            player:setVar("bcnm_instanceid_tick", 0)
            player:setVar("bcnm_instanceid", player:getBattlefieldID()) -- returns 255 if non-existent.
            return true
        end

        inst = player:bcnmRegister(id)
        if (inst > 0) then
            player:setVar("bcnm_instanceid", inst)
            player:setVar("bcnm_instanceid_tick", 0)
            player:updateEvent(0, GetBattleBitmask(id, player:getZoneID(), 1), 0, 0, 69, 0)

            if (entrance ~= nil and player:getBattlefield() ~= nil) then
                player:getBattlefield():setEntrance(entrance)
            end
            -- player:tradeComplete()
        else
            -- no free battlefields at the moment!
            print("no free instances")
            player:setVar("bcnm_instanceid", 255)
            player:setVar("bcnm_instanceid_tick", 0)
        end
    elseif (option == 0 and csid == 0x7d00) then -- Requesting an Instance
        -- Increment the instance ticker.
        -- The client will send a total of THREE EventUpdate packets for each one of the free instances.
        -- If the first instance is free, it should respond to the first packet
        -- If the second instance is free, it should respond to the second packet, etc
        local instance = player:getVar("bcnm_instanceid_tick")
        instance = instance + 1
        player:setVar("bcnm_instanceid_tick", instance)

        if (instance == player:getVar("bcnm_instanceid")) then
            -- respond to this packet
            local mask = GetBattleBitmask(id, player:getZoneID(), 2)
            local status = player:getStatusEffect(EFFECT_BATTLEFIELD)
            local playerbcnmid = status:getPower()
            if (mask < playerbcnmid) then
                mask = GetBattleBitmask(playerbcnmid, player:getZoneID(), 2)
                player:updateEvent(2, mask, 0, 1, 69, skip) -- Add mask number for the correct entering CS
                player:updateEventString('Meme','Meme','Meme','Meme');
                player:bcnmEnter(id)
                player:setVar("bcnm_instanceid_tick", 0)
                -- print("mask is "..mask)
                -- print("playerbcnmid is "..playerbcnmid)

            elseif (mask >= playerbcnmid) then
                mask = GetBattleBitmask(id, player:getZoneID(), 2)
                player:updateEvent(2, mask, 0, 1, 1, skip) -- Add mask number for the correct entering CS
                player:updateEventString('Meme','Meme','Meme','Meme','Meme');
                player:bcnmEnter(id)
                player:setVar("bcnm_instanceid_tick", 0)
                -- print("mask2 is "..mask)
                -- print("playerbcnmid2 is "..playerbcnmid)
            end

            if (entrance ~= nil and player:getBattlefield() ~= nil) then
                player:getBattlefield():setEntrance(entrance)
            end

        elseif (player:getVar("bcnm_instanceid") == 255) then -- none free
            -- print("nfa")
            -- player:updateEvent(2, 5, 0, 0, 1, 0)  -- @cs 32000 0 0 0 0 0 0 0 2
            -- param1
            -- 2=generic enter cs
            -- 3=spam increment instance requests
            -- 4=cleared to enter but cant while ppl engaged
            -- 5=dont meet req, access denied.
            -- 6=room max cap
            -- param2 alters the eventfinish option (offset)
            -- param7/8 = does nothing??
        end
        -- !pos -517 159 -209
        -- !pos -316 112 -103
        -- player:updateEvent(msgid, bcnmFight, 0, record, numadventurers, skip) skip=1 to skip anim
        -- msgid 1=wait a little longer, 2=enters
    end

    return true
end

function EventFinishBCNM(player, csid, option)
    print("FINISH csid "..csid.." option "..option)

    if (player:hasStatusEffect(EFFECT_BATTLEFIELD) == false) then -- Temp condition for normal bcnm (started with onTrigger)
        return false
    else
        local id = player:getVar("trade_bcnmid")
        local item = player:getVar("trade_itemid")

        if (id == 68 or id == 418 or id == 450 or id == 482 or id == 545 or id == 578 or id == 609 or id == 293) then
            player:tradeComplete() -- Removes the item
        elseif ((item >= 1426 and item <= 1440) or item == 1130 or item == 1131 or item == 1175 or item == 1177 or item == 1180 or item == 1178 or item == 1551 or item == 1552 or item == 1553) then -- Orb and Testimony (one time item)
            player:createWornItem(item)
        end
        return true
    end

end

-- Returns TRUE if you're trying to do a maat fight, regardless of outcome e.g. if you trade testimony on wrong job, this will return true in order to prevent further execution of TradeBCNM. Returns FALSE if you're not doing a maat fight (in other words, not trading a testimony!!)
function CheckMaatFights(player, zone, trade, npc)
    player:setVar("trade_bcnmid", 0)
    player:setVar("trade_itemid", 0)
    -- check for maat fights (one maat fight per zone in the db, but >1 mask entries depending on job, so we
    -- need to choose the right one depending on the players job, and make sure the right testimony is traded,
    -- and make sure the level is right!
    local itemid = trade:getItemId()
    local job = player:getMainJob()
    local lvl = player:getMainLvl()

    if (itemid >= 1426 and itemid <= 1440) then -- The traded item IS A TESTIMONY
        if (lvl < 66) then
            return true
        end

        if (player:isBcnmsFull() == 1) then -- temp measure, this will precheck the instances
            print("all bcnm instances are currently occupied.")
            npc:messageBasic(246, 0, 0)
            return true
        end

        -- Zone, {item, job, menu, bcnmid, ...}
        maatList =
        {
            139, {1426, 1, 32, 5, 1429, 4, 64, 6, 1436, 11, 128, 7},       -- Horlais Peak [WAR BLM RNG]
            144, {1430, 5, 64, 70, 1431, 6, 128, 71, 1434, 9, 256, 72},    -- Waughroon Shrine [RDM THF BST]
            146, {1427, 2, 32, 101, 1428, 3, 64, 102, 1440, 15, 128, 103}, -- Balga's Dais [MNK WHM SMN]
            168, {1437, 12, 4, 194, 1438, 13, 8, 195, 1439, 14, 16, 196},  -- Chamber of Oracles [SAM NIN DRG]
            206, {1432, 7, 32, 517, 1433, 8, 64, 518, 1435, 10, 128, 519}  -- Qu'Bia Arena [PLD DRK BRD]
        }

        for nb = 1, #maatList, 2 do
            if (maatList[nb] == zone) then
                for nbi = 1, #maatList[nb + 1], 4 do
                    if (itemid == maatList[nb + 1][nbi] and job == maatList[nb + 1][nbi + 1]) then
                        player:startEvent(0x7d00, 0, 0, 0, maatList[nb + 1][nbi + 2], 0, 0, 0, 0)
                        player:setVar("trade_bcnmid", maatList[nb + 1][nbi + 3])
                        player:setVar("trade_itemid", maatList[nb + 1][nbi])
                        break
                    end
                end
            end
        end

        return true
    end
    -- if it got this far then its not a testimony
    return false
end

function GetBattleBitmask(id, zone, mode)
    -- normal sweep for NON MAAT FIGHTS
    local ret = -1;
    local mask = 0;

    local battlefieldlist = battlefield_bitmask_map[zone]

    if battlefieldlist then
        for index, battlefield in ipairs(battlefield_bitmask_map[zone]) do
            if id == battlefield then
                if mode == 1 then
                    ret = mask + bit.lshift(index + 1, 2);
                else
                    ret = mask + index;
                end
            end
        end
    else
        printf("[bcnm] unable to get bitmask for battlefield: %u, zone: %u", id, zone);
    end
    
    return ret
end

function ItemToBCNMID(player, zone, trade)
    for zoneindex = 1, #itemid_bcnmid_map, 2 do
        if (zone==itemid_bcnmid_map[zoneindex]) then -- matched zone
            for bcnmindex = 1, #itemid_bcnmid_map[zoneindex + 1], 2 do -- loop bcnms in this zone
                if (trade:getItemId()==itemid_bcnmid_map[zoneindex+1][bcnmindex]) then
                    local item = trade:getItemId()
                    local questTimelineOK = 0

                    -- Job/lvl condition for smn battle lvl20
                    if (item >= 1544 and item <= 1549 and player:getMainJob() == JOBS.SMN and player:getMainLvl() >= 20) then
                        questTimelineOK = 1
                    elseif (item == 1166 and player:getVar("aThiefinNorgCS") == 6) then -- AF3 SAM condition
                        questTimelineOK = 1
                    elseif (item == 1551) then -- BCNM20
                        questTimelineOK = 1
                    elseif (item == 1552) then -- BCNM30
                        questTimelineOK = 1
                    elseif (item == 1131) then -- BCNM40
                        questTimelineOK = 1
                    elseif (item == 1177) then -- BCNM50
                        questTimelineOK = 1
                    elseif (item == 1130) then -- BCNM60
                        questTimelineOK = 1
                    elseif (item == 1175) then -- KSNM30
                        questTimelineOK = 1
                    elseif (item == 1178) then -- KSNM30
                        questTimelineOK = 1
                    elseif (item == 1180) then -- KSNM30
                        questTimelineOK = 1
                    elseif (item == 1553) then -- KSNM99
                        questTimelineOK = 1
                    elseif (item == 1550 and (player:getQuestStatus(OUTLANDS, DIVINE_MIGHT) == QUEST_ACCEPTED or player:getQuestStatus(OUTLANDS, DIVINE_MIGHT_REPEAT) == QUEST_ACCEPTED)) then -- Divine Might
                        questTimelineOK = 1
                    elseif (item == 1169 and player:getVar("ThePuppetMasterProgress") == 2) then -- The Puppet Master
                        questTimelineOK = 1
                    elseif (item == 1171 and player:getVar("ClassReunionProgress") == 5) then -- Class Reunion
                        questTimelineOK = 1
                    elseif (item == 1172 and player:getVar("CarbuncleDebacleProgress") == 3) then -- Carbuncle Debacle (Gremlims)
                        questTimelineOK = 1
                    elseif (item == 1174 and player:getVar("CarbuncleDebacleProgress") == 6) then -- Carbuncle Debacle (Ogmios)
                        questTimelineOK = 1
                    end

                    if (questTimelineOK == 1) then
                        player:setVar("trade_bcnmid", itemid_bcnmid_map[zoneindex+1][bcnmindex+1])
                        player:setVar("trade_itemid", itemid_bcnmid_map[zoneindex+1][bcnmindex])
                        return itemid_bcnmid_map[zoneindex+1][bcnmindex+1]
                    end

                end
            end
        end
    end
    return -1
end


-- E.g. mission checks go here, you must know the right bcnmid for the mission you want to code.
--      You also need to know the bitmask (event param) which should be put in bcnmid_param_map

function checkNonTradeBCNM(player, npc, mode)
    local mask = 0
    local Zone = player:getZoneID()
    mode = mode or 2;

    local checks = 
    {
        [6] =   {
                    [640] = function() return (player:getCurrentMission(COP) == THREE_PATHS  and  player:getVar("COP_Ulmia_s_Path") == 6)  end, -- flames_for_the_dead
                    [643] = function() return (player:hasKeyItem(ZEPHYR_FAN))  end, -- Brothers ENM
                },
        [8] =   {
                    [672] = function() return (player:getCurrentMission(COP) == THREE_PATHS  and  player:getVar("COP_Ulmia_s_Path") == 5)  end, -- head_wind
                    [673] = function() return (player:hasKeyItem(MIASMA_FILTER)==true)  end,
                },
        [10] =  {
                    [704] = function() return (player:getCurrentMission(COP) == DARKNESS_NAMED  and  player:getVar("PromathiaStatus") == 2)  end,-- DARKNESS_NAMED
                    [706] = function() return (player:hasKeyItem(VIAL_OF_DREAM_INCENSE)==true)  end, -- waking_dreams (diabolos avatar quest)
                },
        [13] =  {
                    [736] = function() return (player:getCurrentMission(COP) == THREE_PATHS  and  player:getVar("COP_Louverance_s_Path") == 5)  end, -- century_of_hardship
                },
        [17] = {
                    [768] = function()
                                return (player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") ==1 )  or
                                       (player:getCurrentMission(COP) == THE_MOTHERCRYSTALS and player:hasKeyItem(LIGHT_OF_HOLLA) == false)
                            end, -- light of holla
               },
        [19] = {
                    [800] = function() return (player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") ==1 )  end,
                    [800] = function() return (player:getCurrentMission(COP) == THE_MOTHERCRYSTALS and player:hasKeyItem(LIGHT_OF_DEM) == false)  end, -- light of dem
               },
        [21] = {
                    [832] = function() return (player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") ==1 )  end,
                    [832] = function() return (player:getCurrentMission(COP) == THE_MOTHERCRYSTALS and player:hasKeyItem(LIGHT_OF_MEA) == false)  end, -- light of mea
               },
        [23] = {
                    [864] = function() return (player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus")==8)  end, -- desires of emptiness
               },
        [29] = {
                    [896] = function() return (player:getQuestStatus(JEUNO,STORMS_OF_FATE) == QUEST_ACCEPTED and player:getVar('StormsOfFate') == 2)  end,  -- Storms of Fate BCNM
               },
        [31] = {
                    [960] = function() return (player:getCurrentMission(COP) == ANCIENT_VOWS and player:getVar("PromathiaStatus") == 2)  end,  -- Ancient Vows bcnm
                    [961] = function() return (player:getCurrentMission(COP) == THE_SAVAGE and player:getVar("PromathiaStatus") == 1)  end,
               },
        [32] = {
                    [992] = function() return (player:getCurrentMission(COP) == ONE_TO_BE_FEARED and player:getVar("PromathiaStatus")==2)  end, -- one_to_be_feared
                    [993] = function() return (player:getCurrentMission(COP) == THE_WARRIOR_S_PATH)  end, -- warriors_path
               },
        [35] = {
                    [1024] = function() return (player:getCurrentMission(COP) == WHEN_ANGELS_FALL and player:getVar("PromathiaStatus")==4)  end, -- when_angels_fall
               },
        [36] = {
                    [1056] = function() return (player:getCurrentMission(COP) ==  DAWN and player:getVar("PromathiaStatus")==2)  end, -- dawn
               },
        [57] = {
                    [1092] = function() return (player:getCurrentMission(TOAU) ==  LEGACY_OF_THE_LOST)  end, -- TOAU-35 Legacy of the Lost
               },
        [64] =  {
                    [1124] = function() return (player:getCurrentMission(TOAU) ==  SHIELD_OF_DIPLOMACY and player:getVar("AhtUrganStatus")==2)  end, -- TOAU-22 shield of diplomacy
                },
        [67] =  {
                    [1156] = function() return (player:getCurrentMission(TOAU) ==  PUPPET_IN_PERIL and player:getVar("AhtUrganStatus")==1)  end, -- TOAU-29 Puppet in Peril
                },
        [139] = {
                    [0] = function()
                              return ((player:getCurrentMission(BASTOK) == THE_EMISSARY_SANDORIA2 or 
                                  player:getCurrentMission(WINDURST) == THE_THREE_KINGDOMS_SANDORIA2) and player:getVar("MissionStatus") == 9)
                          end, -- Mission 2-3
                    [3] = function() return (player:getCurrentMission(SANDORIA) == THE_SECRET_WEAPON and player:getVar("SecretWeaponStatus") == 2)  end,
                },
        [140] = {
                    [32] = function()
                                local MissionStatus = player:getVar("MissionStatus");
                                local sTcCompleted = player:hasCompletedMission(SANDORIA, SAVE_THE_CHILDREN);
                                return (player:getCurrentMission(SANDORIA) == SAVE_THE_CHILDREN and (sTcCompleted and MissionStatus <= 2 or sTcCompleted == false and MissionStatus == 2))
                           end, -- Sandy Mission 1-3
                    [33] = function() return (player:hasKeyItem(DRAGON_CURSE_REMEDY))  end, -- DRG Flag Quest
                },
        [144] = {
                    [64] = function() return ((player:getCurrentMission(SANDORIA) == JOURNEY_TO_BASTOK2 or
                        player:getCurrentMission(WINDURST) == THE_THREE_KINGDOMS_BASTOK2) and player:getVar("MissionStatus") == 10) end, -- Mission 2-3
                    [67] = function() return ((player:getCurrentMission(BASTOK) == ON_MY_WAY) and (player:getVar("MissionStatus") == 2))  end,
                },
        [146] = {
                    [96] = function() return (player:hasKeyItem(DARK_KEY))  end, -- Mission 2-3
                    [99] = function() return ((player:getCurrentMission(WINDURST) == SAINTLY_INVITATION) and (player:getVar("MissionStatus") == 1))  end, -- Mission 6-2
                },
        [163] = {
                    [128] = function() return (player:getCurrentMission(ZILART) == THE_TEMPLE_OF_UGGALEPIH)  end, -- Zilart Mission 4
                },
        [165] = {
                    [160] = function() return (player:getCurrentMission(player:getNation()) == 15 and player:getVar("MissionStatus") == 3)  end, -- Mission 5-2
                    [161] = function() return (player:getCurrentMission(BASTOK) == WHERE_TWO_PATHS_CONVERGE and player:getVar("BASTOK92") == 1)  end, -- bastok 9-2
                },
        [168] = {
                    [192] = function() return (player:getCurrentMission(ZILART) == THROUGH_THE_QUICKSAND_CAVES or player:getCurrentMission(ZILART) == THE_CHAMBER_OF_ORACLES)  end, -- Zilart Mission 6
                },
        [170] = {
                    [224] = function() return (player:hasKeyItem(MOON_BAUBLE))  end, -- The Moonlit Path
                    [225] = function() return ((player:getCurrentMission(WINDURST) == MOON_READING) and player:getVar("WINDURST92") == 2)  end, -- Moon reading
                },
        [179] = {
                    [256] = function() return (player:getCurrentMission(ZILART) == RETURN_TO_DELKFUTTS_TOWER and player:getVar("ZilartStatus") == 3)  end, -- Zilart Mission 8
                },
        [180] = {
                    [288] = function() return (player:getCurrentMission(ZILART) == ARK_ANGELS and player:getVar("ZilartStatus") == 1 and qmid == 17514791 and player:hasKeyItem(SHARD_OF_APATHY) == false)  end, -- Hume, Ark Angels 1
                    [289] = function() return (player:getCurrentMission(ZILART) == ARK_ANGELS and player:getVar("ZilartStatus") == 1 and qmid == 17514792 and player:hasKeyItem(SHARD_OF_COWARDICE) == false)  end, -- Tarutaru, Ark Angels 2
                    [290] = function() return (player:getCurrentMission(ZILART) == ARK_ANGELS and player:getVar("ZilartStatus") == 1 and qmid == 17514793 and player:hasKeyItem(SHARD_OF_ENVY) == false)  end, -- Mithra, Ark Angels 3
                    [291] = function() return (player:getCurrentMission(ZILART) == ARK_ANGELS and player:getVar("ZilartStatus") == 1 and qmid == 17514794 and player:hasKeyItem(SHARD_OF_ARROGANCE) == false)  end, -- Elvaan, Ark Angels 4
                    [292] = function() return (player:getCurrentMission(ZILART) == ARK_ANGELS and player:getVar("ZilartStatus") == 1 and qmid == 17514795 and player:hasKeyItem(SHARD_OF_RAGE) == false)  end, -- Galka, Ark Angels 5
                },
        [181] = {
                    [320] = function() return (player:getCurrentMission(ZILART) == THE_CELESTIAL_NEXUS)  end, -- Zilart Mission 16
                },
        [201] = {
                    [416] = function() return (player:hasKeyItem(TUNING_FORK_OF_WIND))  end, -- Trial by Wind
                    [420] = function() return (player:getCurrentMission(ASA) == SUGAR_COATED_DIRECTIVE and player:hasKeyItem(DOMINAS_EMERALD_SEAL))  end,
                },
        [202] = {
                    [448] = function() return (player:hasKeyItem(TUNING_FORK_OF_LIGHTNING))  end, -- Trial by Lightning
                    [452] = function() return (player:getCurrentMission(ASA) == SUGAR_COATED_DIRECTIVE and player:hasKeyItem(DOMINAS_VIOLET_SEAL))  end,
               },
        [203] = {
                    [480] = function() return (player:hasKeyItem(TUNING_FORK_OF_ICE))  end, -- Trial by Ice
                    [484] = function() return (player:getCurrentMission(ASA) == SUGAR_COATED_DIRECTIVE and player:hasKeyItem(DOMINAS_AZURE_SEAL))  end,
                },
        [206] = {
                    [512] = function() return (player:getCurrentMission(player:getNation()) == 14 and player:getVar("MissionStatus") == 11)  end, -- Mission 5-1
                    [516] = function() return (player:getCurrentMission(SANDORIA) == THE_HEIR_TO_THE_LIGHT and player:getVar("MissionStatus") == 3)  end, -- sando 9-2
                --[[ 
                    Temp disabled pending BCNM mob fixes
                    [532] = function() return (player:getCurrentMission(ACP) >= THOSE_WHO_LURK_IN_SHADOWS_III and player:hasKeyItem(MARK_OF_SEED))  end, -- ACP Mission 7
                ]]
                },
        [207] = {
                    [544] = function() return (player:hasKeyItem(TUNING_FORK_OF_FIRE))  end, -- Trial by Fire
                    [547] = function() return (player:getCurrentMission(ASA) == SUGAR_COATED_DIRECTIVE and player:hasKeyItem(DOMINAS_SCARLET_SEAL))  end,
                },
        [209] = {
                    [576] = function() return (player:hasKeyItem(TUNING_FORK_OF_EARTH))  end, -- Trial by Earth
                    [580] = function() return (player:getCurrentMission(ASA) == SUGAR_COATED_DIRECTIVE and player:hasKeyItem(DOMINAS_AMBER_SEAL))  end,
               },
        [211] = {
                    [608] = function() return (player:hasKeyItem(TUNING_FORK_OF_WATER))  end, -- Trial by Water
                    [611] = function() return (player:getCurrentMission(ASA) == SUGAR_COATED_DIRECTIVE and player:hasKeyItem(DOMINAS_CERULEAN_SEAL))  end,
                },
    }
    
    for keyid, condition in pairs(checks[Zone]) do
        if condition() and GetBattleBitmask(keyid, Zone, mode) ~= -1 then
            mask = mask + GetBattleBitmask(keyid, Zone, mode);
            player:setVar("trade_bcnmid", keyid);
            -- todo: multiple choice bcnms
            break;
        end;
    end;
    
    if mode == 2 then
        player:startEvent(0x7d00, 0, 0, 0, mask, 0, 0, 0, 0);
    end
    return mask;
end

function CutsceneSkip(player, npc)

    local skip = 0
    local Zone = player:getZoneID()

    if (Zone == 6) then -- Bearclaw Pinnacle
           if ((player:hasCompletedMission(COP, THREE_PATHS)) or (player:getCurrentMission(COP) == THREE_PATHS and player:getVar("COP_Ulmia_s_Path") > 6)) then -- flames_for_the_dead
            skip = 1
        end
    elseif (Zone == 8) then -- Boneyard Gully
           if ((player:hasCompletedMission(COP, THREE_PATHS)) or (player:getCurrentMission(COP) == THREE_PATHS and player:getVar("COP_Ulmia_s_Path") > 5)) then -- head_wind
            skip = 1
        end
    elseif (Zone == 10) then -- The_Shrouded_Maw
        if ((player:hasCompletedMission(COP, DARKNESS_NAMED)) or (player:getCurrentMission(COP) == DARKNESS_NAMED and player:getVar("PromathiaStatus") > 2)) then -- DARKNESS_NAMED
            skip = 1
        elseif ((player:hasCompleteQuest(WINDURST, WAKING_DREAMS)) or (player:hasKeyItem(WHISPER_OF_DREAMS))) then -- waking_dreams (diabolos avatar quest)
            skip = 1
        end
    elseif (Zone == 13) then -- Mine Shaft 2716
        if ((player:hasCompletedMission(COP, THREE_PATHS)) or (player:getCurrentMission(COP) == THREE_PATHS and player:getVar("COP_Louverance_s_Path") > 5)) then -- century_of_hardship
            skip = 1
        end
    elseif (Zone == 17) then -- Spire of Holla
        if ((player:hasCompletedMission(COP, THE_MOTHERCRYSTALS)) or (player:hasKeyItem(LIGHT_OF_HOLLA))) then -- light of holla
            skip = 1
        end
    elseif (Zone == 19) then -- Spire of Dem
        if ((player:hasCompletedMission(COP, THE_MOTHERCRYSTALS)) or (player:hasKeyItem(LIGHT_OF_DEM))) then -- light of dem
            skip = 1
        end
    elseif (Zone == 21) then -- Spire of Mea
        if ((player:hasCompletedMission(COP, THE_MOTHERCRYSTALS)) or (player:hasKeyItem(LIGHT_OF_MEA))) then -- light of mea
            skip = 1
        end
    elseif (Zone == 23) then -- Spire of Vahzl
        if ((player:hasCompletedMission(COP, DESIRES_OF_EMPTINESS)) or (player:getCurrentMission(COP) == DESIRES_OF_EMPTINESS and player:getVar("PromathiaStatus") > 8)) then -- desires of emptiness
            skip = 1
        end
    elseif (Zone == 29) then -- Riverne Site #B01
        if ((player:getQuestStatus(JEUNO,STORMS_OF_FATE) == QUEST_COMPLETED) or (player:getQuestStatus(JEUNO,STORMS_OF_FATE) == QUEST_ACCEPTED and player:getVar("StormsOfFate") > 2)) then -- Storms of Fate
            skip = 1
        end
    elseif (Zone == 31) then -- Monarch Linn
        if (player:hasCompletedMission(COP, ANCIENT_VOWS)) then -- Ancient Vows
            skip = 1
        elseif ((player:hasCompletedMission(COP, THE_SAVAGE)) or (player:getCurrentMission(COP) == THE_SAVAGE and player:getVar("PromathiaStatus") > 1)) then
            skip = 1
        end
    elseif (Zone == 32) then -- Sealion's Den
        if (player:hasCompletedMission(COP, ONE_TO_BE_FEARED)) then -- one_to_be_feared
            skip = 1
        elseif (player:hasCompletedMission(COP, THE_WARRIOR_S_PATH)) then -- warriors_path
            skip = 1
        end
    elseif (Zone == 35) then -- The Garden of RuHmet
        if ((player:hasCompletedMission(COP, WHEN_ANGELS_FALL)) or (player:getCurrentMission(COP) == WHEN_ANGELS_FALL and player:getVar("PromathiaStatus") > 4)) then -- when_angels_fall
            skip = 1
        end
    elseif (Zone == 36) then -- Empyreal Paradox
        if ((player:hasCompletedMission(COP, DAWN)) or (player:getCurrentMission(COP) == DAWN and player:getVar("PromathiaStatus") > 2)) then -- dawn
            skip = 1
        end
    elseif (Zone == 139) then -- Horlais Peak
        if ((player:hasCompletedMission(BASTOK, THE_EMISSARY_SANDORIA2) or player:hasCompletedMission(WINDURST, THE_THREE_KINGDOMS_SANDORIA2)) or
        ((player:getCurrentMission(BASTOK) == THE_EMISSARY_SANDORIA2 or player:getCurrentMission(WINDURST) == THE_THREE_KINGDOMS_SANDORIA2) and player:getVar("MissionStatus") > 9)) then -- Mission 2-3
            skip = 1
        elseif ((player:hasCompletedMission(SANDORIA, THE_SECRET_WEAPON)) or (player:getCurrentMission(SANDORIA) == THE_SECRET_WEAPON and player:getVar("SecretWeaponStatus") > 2)) then
            skip = 1
        end
    elseif (Zone == 140) then -- Ghelsba Outpost
        if ((player:hasCompletedMission(SANDORIA, SAVE_THE_CHILDREN)) or (player:getCurrentMission(SANDORIA) == SAVE_THE_CHILDREN and player:getVar("MissionStatus") > 2)) then -- Sandy Mission 1-3
            skip = 1
        elseif (player:hasCompleteQuest(SANDORIA, THE_HOLY_CREST)) then -- DRG Flag Quest
            skip = 1
        end
    elseif (Zone == 144) then -- Waughroon Shrine
        if ((player:hasCompletedMission(SANDORIA, JOURNEY_TO_BASTOK2) or player:hasCompletedMission(WINDURST, THE_THREE_KINGDOMS_BASTOK2)) or
        ((player:getCurrentMission(SANDORIA) == JOURNEY_TO_BASTOK2 or player:getCurrentMission(WINDURST) == THE_THREE_KINGDOMS_BASTOK2) and player:getVar("MissionStatus") > 10)) then -- Mission 2-3
            skip = 1
        elseif ((player:hasCompletedMission(BASTOK, ON_MY_WAY)) or (player:getCurrentMission(BASTOK) == ON_MY_WAY and player:getVar("MissionStatus") > 2)) then
            skip = 1
        end
    elseif (Zone == 146) then -- Balga's Dais
        if ((player:hasCompletedMission(SANDORIA, JOURNEY_TO_WINDURST2) or player:hasCompletedMission(BASTOK, THE_EMISSARY_WINDURST2)) or
        ((player:getCurrentMission(SANDORIA) == JOURNEY_TO_WINDURST2 or player:getCurrentMission(BASTOK) == THE_EMISSARY_WINDURST2) and player:getVar("MissionStatus") > 8)) then -- Mission 2-3
            skip = 1
        elseif ((player:hasCompletedMission(WINDURST, SAINTLY_INVITATION)) or (player:getCurrentMission(WINDURST) == SAINTLY_INVITATION and player:getVar("MissionStatus") > 1)) then -- Mission 6-2
            skip = 1
        end
    elseif (Zone == 165) then -- Throne Room
        if ((player:hasCompletedMission(player:getNation(), 15)) or (player:getCurrentMission(player:getNation()) == 15 and player:getVar("MissionStatus") > 3)) then -- Mission 5-2
            skip = 1
        end
    elseif (Zone == 168) then -- Chamber of Oracles
        if (player:hasCompletedMission(ZILART, THROUGH_THE_QUICKSAND_CAVES)) then -- Zilart Mission 6
            skip = 1
        end
    elseif (Zone == 170) then -- Full Moon Fountain
        if ((player:hasCompleteQuest(WINDURST, THE_MOONLIT_PATH)) or (player:hasKeyItem(WHISPER_OF_THE_MOON))) then -- The Moonlit Path
            skip = 1
        end
    elseif (Zone == 179) then -- Stellar Fulcrum
        if (player:hasCompletedMission(ZILART, RETURN_TO_DELKFUTTS_TOWER)) then -- Zilart Mission 8
            skip = 1
        end
    elseif (Zone == 180) then -- La'Loff Amphitheater
        if (player:hasCompletedMission(ZILART, ARK_ANGELS)) then
            skip = 1
        end
    elseif (Zone == 181) then -- The Celestial Nexus
        if (player:hasCompletedMission(ZILART, THE_CELESTIAL_NEXUS)) then -- Zilart Mission 16
            skip = 1
        end
    elseif (Zone == 201) then -- Cloister of Gales
        if ((player:hasCompleteQuest(OUTLANDS, TRIAL_BY_WIND)) or (player:hasKeyItem(WHISPER_OF_GALES))) then -- Trial by Wind
            skip = 1
        end
    elseif (Zone == 202) then -- Cloister of Storms
        if ((player:hasCompleteQuest(OTHER_AREAS, TRIAL_BY_LIGHTNING)) or (player:hasKeyItem(WHISPER_OF_STORMS))) then -- Trial by Lightning
            skip = 1
        end
    elseif (Zone == 203) then -- Cloister of Frost
        if ((player:hasCompleteQuest(SANDORIA, TRIAL_BY_ICE)) or (player:hasKeyItem(WHISPER_OF_FROST))) then -- Trial by Ice
            skip = 1
        end
    elseif (Zone == 206) then -- Qu'Bia Arena
        if ((player:hasCompletedMission(player:getNation(), 14)) or (player:getCurrentMission(player:getNation()) == 14 and player:getVar("MissionStatus") > 11)) then -- Mission 5-1
            skip = 1
        elseif ((player:hasCompletedMission(player:getNation(), 23)) or (player:getCurrentMission(player:getNation()) == 23 and player:getVar("MissionStatus") > 4)) then -- Mission 9-2
            skip = 1
        end
    elseif (Zone == 207) then -- Cloister of Flames
        if ((player:hasCompleteQuest(OUTLANDS, TRIAL_BY_FIRE)) or (player:hasKeyItem(WHISPER_OF_FLAMES))) then -- Trial by Fire
            skip = 1
        end
    elseif (Zone == 209) then -- Cloister of Tremors
        if ((player:hasCompleteQuest(BASTOK, TRIAL_BY_EARTH)) or (player:hasKeyItem(WHISPER_OF_TREMORS))) then -- Trial by Earth
            skip = 1
        end
    elseif (Zone == 211) then -- Cloister of Tides
        if ((player:hasCompleteQuest(OUTLANDS, TRIAL_BY_WATER)) or (player:hasKeyItem(WHISPER_OF_TIDES))) then -- Trial by Water
            skip = 1
        end
    end
    return skip
end
