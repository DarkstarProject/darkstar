require("scripts/globals/status")
require("scripts/globals/keyitems")
require("scripts/globals/missions")
require("scripts/globals/quests")
require("scripts/globals/battlefield")

local battlefield_trade_type =
{
    COMPLETE = 0,
    CREATE_WORN_ITEM = 1
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

initiator_checks =
{
    trigger = {},
    trade = {},
}

function GetBattleBitmask(id, zone, mode)
    local ret = 0;
    local mask = 0;

    local battlefieldlist = battlefield_bitmask_map[zone]

    if battlefieldlist then
        for index, battlefield in ipairs(battlefield_bitmask_map[zone]) do
            if id == battlefield then
                if mode == 1 then
                    ret = mask + bit.lshift(1, index - 1);
                else
                    return index;
                end
            end
        end
    else
        printf("[bcnm] unable to get bitmask for battlefield: %u, zone: %u", id, zone);
    end

    return ret
end

-- Call this onTrade for burning circles
function TradeBCNM(player, Zone, trade, npc, battlefieldId, mode)
    mode = mode or 1
    if not trade then
        print("TradeBCNM was sent a nil trade!\n\t Player: "..player:getName().."\n\t zone: "..Zone.."\n")
        return false
    end

    local mainJob = player:getMainJob()

    initiator_checks.trade =
    {
        [139] = {
                    [4]  = {check = function() return trade:hasItemQty(1177, 1) end, itemid = 1177, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [5]  = {check = function() return trade:hasItemQty(1426, 1) and mainJob == JOBS.WAR end, itemid = 1426, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [6]  = {check = function() return trade:hasItemQty(1429, 1) and mainJob == JOBS.BLM end, itemid = 1429, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [7]  = {check = function() return trade:hasItemQty(1436, 1) and mainJob == JOBS.RNG end, itemid = 1436, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [10] = {check = function() return trade:hasItemQty(1552, 1) end, itemid = 1552, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [11] = {check = function() return trade:hasItemQty(1553, 1) end, itemid = 1553, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [12] = {check = function() return trade:hasItemQty(1131, 1) end, itemid = 1131, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [15] = {check = function() return trade:hasItemQty(1175, 1) end, itemid = 1175, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [17] = {check = function() return trade:hasItemQty(1180, 1) end, itemid = 1180, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},-- Horlais Peak
                },
        [140] = {
                    [34] = {check = function() return trade:hasItemQty(1551, 1) end, itemid = 1551, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [35] = {check = function() return trade:hasItemQty(1552, 1) end, itemid = 1552, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [36] = {check = function() return trade:hasItemQty(1552, 1) end, itemid = 1552, tradeType = battlefield_trade_type.CREATE_WORN_ITEM}, -- Ghelsba Outpost
                },
        [144] = {
                    [68] = {check = function() return trade:hasItemQty(1166, 1) and player:getVar("aThiefinNorgCS") == 6 end,
                                itemid = 1166, tradeType = battlefield_trade_type.CONFIRM},  -- AF3 SAM condition

                    [70] = {check = function() return trade:hasItemQty(1430, 1) and mainJob == JOBS.RDM end, itemid = 1430, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [71] = {check = function() return trade:hasItemQty(1431, 1) and mainJob == JOBS.THF end, itemid = 1431, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [72] = {check = function() return trade:hasItemQty(1434, 1) and mainJob == JOBS.BST end, itemid = 1434, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},   -- Waughroon Shrine [RDM THF BST]

                    [73] = {check = function() return trade:hasItemQty(1552, 1) end, itemid = 1552, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [76] = {check = function() return trade:hasItemQty(1553, 1) end, itemid = 1553, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [79] = {check = function() return trade:hasItemQty(1130, 1) end, itemid = 1130, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [81] = {check = function() return trade:hasItemQty(1178, 1) end, itemid = 1178, tradeType = battlefield_trade_type.CREATE_WORN_ITEM}, -- Waughroon Shrine
                    [82] = {check = function() return trade:hasItemQty(1180, 1) end, itemid = 1180, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                },
        [146] = {
                    [100] = {check = function() return trade:hasItemQty(1177, 1) end, itemid = 1551, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [101] = {check = function() return trade:hasItemQty(1427, 1) and mainJob == JOBS.MNK end, itemid = 1427, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [102] = {check = function() return trade:hasItemQty(1428, 1) and mainJob == JOBS.WHM end, itemid = 1428, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [103] = {check = function() return trade:hasItemQty(1440, 1) and mainJob == JOBS.SMN end, itemid = 1429, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},-- Balga's Dais [MNK WHM SMN]
                    [105] = {check = function() return trade:hasItemQty(1551, 1) end, itemid = 1551, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [107] = {check = function() return trade:hasItemQty(1553, 1) end, itemid = 1553, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                },
        [163] = {
                    [129] = {check = function() return trade:hasItemQty(1130, 1) end, itemid = 1130, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [130] = {check = function() return trade:hasItemQty(1130, 1) end, itemid = 1130, tradeType = battlefield_trade_type.CREATE_WORN_ITEM}, -- Sacrificial Chamber
                },
        [168] = {
                    [194] = {check = function() return trade:hasItemQty(1437, 1) and mainJob == JOBS.SAM end, itemid = 1437, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [195] = {check = function() return trade:hasItemQty(1438, 1) and mainJob == JOBS.NIN end, itemid = 1438, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [196] = {check = function() return trade:hasItemQty(1439, 1) and mainJob == JOBS.DRG end, itemid = 1439, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},  -- Chamber of Oracles [SAM NIN DRG]
                },
        [180] = {
                    [293] =
                    {
                        check = function() return trade:hasItemQty(1550, 1) and (player:getQuestStatus(OUTLANDS, DIVINE_MIGHT) == QUEST_ACCEPTED or
                                    player:getQuestStatus(OUTLANDS, DIVINE_MIGHT_REPEAT) == QUEST_ACCEPTED)
                                end, -- LaLoff Amphitheater
                        itemid = 1550, tradeType = battlefield_trade_type.CONFIRM},
                },
        [201] = {
                    [417] = {check = function() return trade:hasItemQty(1174, 1) and player:getVar("CarbuncleDebacleProgress") == 6 end, itemid = 1174, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [418] = {check = function() return trade:hasItemQty(1546, 1) and mainJob == JOBS.SMN and player:getMainLvl() >= 20 end,
                                itemid = 1546, tradeType = battlefield_trade_type.CONFIRM},
                },
        [202] = {
                    [449] = {check = function() return trade:hasItemQty(1172, 1) and player:getVar("CarbuncleDebacleProgress") == 3 end,
                                itemid = 1172, tradeType = battlefield_trade_type.CONFIRM},
                    [450] = {check = function() return trade:hasItemQty(1547, 1) and mainJob == JOBS.SMN and player:getMainLvl() >= 20 end,
                                itemid = 1547, tradeType = battlefield_trade_type.CONFIRM},
                },
        [203] = {
                    [481] = {check = function() return trade:hasItemQty(1171, 1) and player:getVar("ClassReunionProgress") == 5 end,
                                itemid = 1171, tradeType = battlefield_trade_type.CONFIRM},
                    [482] = {check = function() return trade:hasItemQty(1545, 1) and mainJob == JOBS.SMN and player:getMainLvl() >= 20 end,
                                itemid = 1545, tradeType = battlefield_trade_type.CONFIRM},
                },
        [206] = {
                    [517] = {check = function() return trade:hasItemQty(1432, 1) and mainJob == JOBS.PLD end, itemid = 1432, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [518] = {check = function() return trade:hasItemQty(1433, 1) and mainJob == JOBS.DRK end, itemid = 1433, tradeType = battlefield_trade_type.CREATE_WORN_ITEM},
                    [519] = {check = function() return trade:hasItemQty(1435, 1) and mainJob == JOBS.BRD end, itemid = 1435, tradeType = battlefield_trade_type.CREATE_WORN_ITEM}, -- Qu'Bia Arena [PLD DRK BRD]
                },
        [207] = {
                    [545] = {check = function() return trade:hasItemQty(1544, 1) and mainJob == JOBS.SMN and player:getMainLvl() >= 20 end,
                                itemid = 1544, tradeType = battlefield_trade_type.CONFIRM},
                },
        [209] = {
                    [577] = {check = function() return trade:hasItemQty(1169, 1) and player:getVar("ThePuppetMasterProgress") == 2 end,
                                itemid = 1169, tradeType = battlefield_trade_type.CONFIRM},
                    [578] = {check = function() return trade:hasItemQty(1547, 1) and mainJob == JOBS.SMN and player:getMainLvl() >= 20 end,
                                    itemid = 1550, tradeType = battlefield_trade_type.CONFIRM},
                },
        [211] = {
                    [609] = {check = function() return trade:hasItemQty(1549, 1) and mainJob == JOBS.SMN and player:getMainLvl() >= 20 end,
                                itemid = 1549, tradeType = battlefield_trade_type.CONFIRM},
                },
    }

    if not battlefieldId then
        if player:hasStatusEffect(EFFECT_BATTLEFIELD) then -- cant start a new bc
            player:messageBasic(94, 0, 0)
            return false
        elseif player:hasWornItem(trade:getItemId()) then -- If already used orb or testimony
            player:messageBasic(56, 0, 0) -- i need correct dialog
            return false
        end
    end

    local mask = 0
    for keyid, condition in pairs(initiator_checks.trade[Zone]) do
        if condition.check() and GetBattleBitmask(keyid, Zone, mode) then
            mask = mask + GetBattleBitmask(keyid, Zone, mode)
            -- we only get battlefieldId param passed if running from eventupdate
            if battlefieldId == keyid then
                return mask
            end
            player:setLocalVar("[battlefield]traded", mask)
        end
    end

    player:startEvent(0x7d00, 0, 0, 0, mask, 0, 0, 0, 0)
    return mask
end

function EventTriggerBCNM(player, npc)
    if (player:hasStatusEffect(EFFECT_BATTLEFIELD)) then
        if player:isInBattlefieldList() then
            player:startEvent(0x7d03) -- Run Away or Stay menu
        else -- You're not in the BCNM but you have the Battlefield effect. Think: non-trader in a party
            -- fuck thinking
            -- todo: max make this halal for party members
            status = player:getStatusEffect(EFFECT_BATTLEFIELD)
            playerbcnmid = status:getPower()
            playermask = GetBattleBitmask(playerbcnmid, player:getZoneID(), 1)
            if (playermask ~= -1) then
                -- This gives players who did not trade to go in the option of entering the fight
                player:startEvent(0x7d00, 0, 0, 0, playermask, 0, 0, 0, 0)
            else
                player:messageBasic(94, 0, 0)
            end
        end
        return true
    else
        if (CheckNonTradeBCNM(player, npc)) then
            return true
        end
    end

    return false
end

-- checks = { [zone] = { [bcnmid] = function() return (this return must evaluate to true for entry) end,} }
function CheckNonTradeBCNM(player, npc, mode, battlefieldId)
    local mask = 0
    local Zone = player:getZoneID()
    mode = mode or 1;

    initiator_checks.trigger =
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
                    [800] = function() return (player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") ==1 ) or
                            (player:getCurrentMission(COP) == THE_MOTHERCRYSTALS and player:hasKeyItem(LIGHT_OF_DEM) == false)  end, -- light of dem
               },
        [21] = {
                    [832] = function() return (player:getCurrentMission(COP) == BELOW_THE_ARKS and player:getVar("PromathiaStatus") ==1 ) or
                            (player:getCurrentMission(COP) == THE_MOTHERCRYSTALS and player:hasKeyItem(LIGHT_OF_MEA) == false)  end, -- light of mea
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
                    ----[[
                    --Temp disabled pending BCNM mob fixes
                    [532] = function() return (player:getCurrentMission(ACP) >= THOSE_WHO_LURK_IN_SHADOWS_III and player:hasKeyItem(MARK_OF_SEED))  end, -- ACP Mission 7
                    --]]

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
    for keyid, condition in pairs(initiator_checks.trigger[Zone]) do
        if condition() and GetBattleBitmask(keyid, Zone, mode) then
            mask = mask + GetBattleBitmask(keyid, Zone, mode)
            -- we only get battlefieldId param passed if running from eventupdate
            player:setLocalVar("[battlefield]initiated", 1)
            if battlefieldId == keyid then
                return mask
            end
        end
    end

    player:startEvent(0x7d00, 0, 0, 0, mask, 0, 0, 0, 0)
    return mask;
end

local function CompleteTrade(player)
    local battlefieldId = player:getBattlefieldID()
    local info = initiator_checks[player:getZoneID()][battlefieldId]
    local tradeType = info.tradeType
    local dun = player:hasItem(info.itemid) and not player:hasWornItem(info.itemid)

    if tradeType == battlefield_trade_type.CONFIRM then
        player:delItem(info.itemid)
    elseif tradeType == battlefield_trade_type.CREATE_WORN_ITEM then
        player:createWornItem(info.itemid)
    end

    player:setLocalVar("[battlefield]traded", 0)
    player:setLocalVar("[battlefield]trade_id", battlefieldId)
    player:getBattlefield():setLocalVar("trade_id", player:getLocalVar("[battlefield]trade_id"))
    return dun
end

function EventUpdateBCNM(player, csid, option, entrance)
    if csid == 0x7d00 then
        local zone = player:getZoneID();
        local battlefieldIndex = bit.rshift(option, 4) + 1
        local battlefieldId = battlefield_bitmask_map[zone][battlefieldIndex]
        local effect = player:getStatusEffect(EFFECT_BATTLEFIELD);
        local skip = CutsceneSkip(player, battlefieldId);
        local area = player:getLocalVar("[battlefield]area");
        local id = battlefieldId or player:getBattlefieldID()

        if option ~= 255 then
            local clearTime, name, partySize = 1
            local canRegister = false

            -- is this a party member or initiator
            if effect then
                if not player:isInBattlefieldList() then
                    local battlefield = player:getZone():getBattlefieldByInitiator(effect:getSubType())
                    if battlefield then
                        -- todo: actual checks for non traders
                        -- traded, fuck checking anything else
                        if battlefield:getLocalVar("trade_id") ~= 0 then
                            canRegister = true
                        else
                        -- check party member crap

                        end
                    end
                else
                    canRegister = true
                    for _, member in pairs(player:getAlliance()) do
                        if member:getZoneID() == player:getZoneID() and not member:getBattlefield() then
                            member:addStatusEffect(effect)
                        end
                    end
                end
            end

            if player:getLocalVar("[battlefield]initiated") == 1 then
                print("ass")
                canRegister = CompleteTrade(player) or (skip or CheckNonTradeBCNM(player, npc, 1, battlefieldId))
            end

            local result = g_Battlefield.ReturnCode.REQS_NOT_MET

            if canRegister then
                result = player:registerBattlefield(id, area + 1)
            end

            if result ~= g_Battlefield.ReturnCode.CUTSCENE then
                player:setLocalVar("[battlefield]area", area + 1)
            else
                if id ~= -1 then
                    local battlefield = player:getBattlefield()
                    if battlefield then
                        name, clearTime, partySize = battlefield:getRecord()
                        mask = battlefield:getID()
                    end
                end
            end

            player:updateEvent(result, battlefieldIndex - 1, 0, clearTime, partySize, skip)
            player:updateEventString(name)

            if result >= g_Battlefield.Status.LOCKED or result >= g_Battlefield.ReturnCode.LOCKED or not canRegister then
                print("hemorrhoids")
                return 0
            end
        end
    end
   return true
end

function EventFinishBCNM(player, csid, option)
    print("FINISH csid "..csid.." option "..option)

    if csid == 0x7d00 then
        player:setLocalVar("[battlefield]area", 0)
        player:setLocalVar("[battlefield]initiated", 0)
    end

    if not player:hasStatusEffect(EFFECT_BATTLEFIELD) then -- Temp condition for normal bcnm (started with onTrigger)
        return false
    end
end

function CutsceneSkip(player, npc)

    local skip = false
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
