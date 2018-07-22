-----------------------------------
--
--     Functions for Conquest system
--
-----------------------------------
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/common");
require("scripts/globals/zone");
-----------------------------------

-----------------------------------
-- convenience constants
-----------------------------------

CONQUEST_TALLY_START = 0;
CONQUEST_TALLY_END   = 1;
CONQUEST_UPDATE      = 2;

nationAlly = 3;

-----------------------------------
-- San d'Oria inventory
-- {Option,CP,Item}
-----------------------------------

SandInv = {32929,10,4181,32928,7,4182,32931,9000,15541,
           32930,2500,15542,32933,500,15761,32934,1000,15762,
           32935,2000,15763,32770,1000,12510,32771,1000,12753,
           32772,1000,13004,32774,1000,13718,32769,1000,16544,
           32773,1000,16691,32768,1000,17167,32785,2000,12630,
           32786,2000,12882,32788,2000,13045,32784,2000,16852,
           32787,2000,17367,32802,4000,12431,32803,4000,12687,
           32804,4000,12943,32801,4000,13104,32807,4000,13495,
           32805,4000,16744,32800,4000,16844,32806,4000,17150,
           32820,8000,12336,32817,8000,12559,32818,8000,12815,
           32819,8000,13719,32816,8000,16601,32834,16000,12312,
           32835,16000,12313,32838,16000,12686,32839,16000,12942,
           32837,16000,13105,32836,16000,13107,32840,16000,13220,
           32841,16000,13720,32833,16000,16571,32832,16000,16851,
           32854,24000,12321,32850,24000,12430,32852,24000,12558,
           32853,24000,12814,32849,24000,13106,32848,24000,13580,
           32851,24000,13722,32856,24000,16599,32857,24000,16805,
           32855,24000,17067,32866,32000,13557,32865,32000,16886,
           32864,32000,18738,32882,40000,13140,32880,40000,14013,
           32881,40000,14014,32899,48000,16893,32896,48000,16953,
           32898,48000,17458,32897,48000,17934,32912,56000,14428,
           32932,5000,17583,32936,5000,28540};

-----------------------------------
-- Bastok inventory
-- {Option,CP,Item}
-----------------------------------

BastInv = {32929,10,4181,32928,7,4182,32931,9000,15541,
           32930,2500,15542,32933,500,15761,32934,1000,15762,
           32935,2000,15763,32771,1000,12509,32772,1000,12752,
           32773,1000,13003,32768,1000,16433,32770,1000,16648,
           32775,1000,16780,32774,1000,17128,32769,1000,17223,
           32788,2000,12337,32785,2000,12629,32786,2000,12881,
           32787,2000,16745,32784,2000,17048,32802,4000,12438,
           32803,4000,12566,32804,4000,12694,32805,4000,12822,
           32806,4000,12950,32801,4000,13098,32809,4000,13497,
           32808,4000,13830,32800,4000,16712,32807,4000,16806,
           32817,8000,12422,32818,8000,12678,32819,8000,12934,
           32820,8000,13721,32816,8000,16516,32821,8000,17283,
           32834,16000,12550,32835,16000,12806,32833,16000,13099,
           32832,16000,16529,32836,16000,17129,32837,16000,17253,
           32851,24000,12304,32853,24000,13064,32848,24000,13100,
           32849,24000,13582,32850,24000,16557,32852,24000,17151,
           32866,32000,13558,32864,32000,15957,32865,32000,17807,
           32882,40000,13141,32881,40000,13880,32880,40000,14015,
           32896,48000,16799,32897,48000,17457,32899,48000,17655,
           32898,48000,18196,32912,56000,14429,32932,5000,17584,
           32936,5000,28540};

-----------------------------------
-- Windurst inventory
-- {Option,CP,Item}
-----------------------------------

WindInv = {32929,10,4181,32836,16000,12734,32805,4000,12982,
           32928,7,4182,32837,16000,12862,32807,4000,13221,
           32931,9000,15541,32838,16000,12990,32808,4000,13496,
           32930,2500,15542,32833,16000,13102,32806,4000,16747,
           32933,500,15761,32839,16000,16810,32800,4000,16776,
           32934,1000,15762,32840,16000,16694,32819,8000,12614,
           32935,2000,15763,32832,16000,17082,32820,8000,12743,
           32771,1000,12915,32848,24000,13103,32821,8000,12870,
           32770,1000,16442,32849,24000,13581,32822,8000,12998,
           32769,1000,17028,32851,24000,16808,32818,8000,13101,
           32772,1000,17130,32852,24000,16809,32816,8000,16463,
           32768,1000,17159,32850,24000,17094,32824,8000,16669,
           32785,2000,12484,32865,32000,12363,32823,8000,16807,
           32786,2000,12653,32866,32000,13559,32817,8000,17282,
           32787,2000,12719,32864,32000,15958,32834,16000,12478,
           32788,2000,12855,32882,40000,13142,32835,16000,12606,
           32789,2000,12975,32880,40000,14016,32932,5000,17585,
           32790,2000,16746,32881,40000,14017,32804,4000,12854,
           32791,2000,16930,32898,48000,17508,32912,56000,14430,
           32784,2000,17103,32897,48000,17530,32803,4000,12726,
           32801,4000,12470,32899,48000,17617,32896,48000,18145,
           32802,4000,12598,32936,5000,28540};

-----------------------------------
-- Crystal Donate Array
-- Conquest Point Required for recharged the ring + charge
-- CP Reward for Supply Quest
-- TP Fees
-----------------------------------

DonateCrys = {4096,4097,4098,4099,4100,4101,4102,4103,4238,4239,4240,4241,4242,4243,4244,4245};
XpRing = {350,700,600}; RingCharg = {7,7,3};
supplyReward = {10,30,40,10,40,10,40,40,70,50,60,40,70,70,70,70,70,70,70};
tpFees = { 100, 100, 150, 100, 150, 100, 100, 150, 350, 400, 150, 250, 300, 500, 250, 350, 500, 0, 300 }

----------------------------------------------------------------
-- function tradeConquestGuard()
-----------------------------------------------------------------

function tradeConquestGuard(player,npc,trade,guardnation,guardtype)

    -- Nation:    -- dsp.nation.SANDORIA, dsp.nation.BASTOK, dsp.nation.WINDURST, dsp.nation.OTHER(Jeuno)
    -- Type:     1: city, 2: foreign, 3: outpost, 4: border

    local myCP = player:getCP();
    local item = trade:getItemId();
    local AddPoints = 0;

    if (player:getNation() == guardnation or guardnation == dsp.nation.OTHER) then
        if (guardtype ~= 3 and guardtype ~= 4) then -- all guard can trade crystal except outpost and border.
            if (item >= 4096 and item <= 4103 or item >= 4238 and item <= 4245) then
                for Crystal = 1,#DonateCrys,1 do
                    local tcount = trade:getItemQty(DonateCrys[Crystal])

                    if (tcount > 0 and trade:hasItemQty(DonateCrys[Crystal],tcount)) then
                        if (player:getRank() == 1) then
                            player:showText(npc,CONQUEST - 7);
                            break;
                        elseif (player:getRankPoints() == 4000) then
                            player:showText(npc,CONQUEST + 43);
                            break;
                        elseif (DonateCrys[Crystal] == 4102 or DonateCrys[Crystal] == 4103 or DonateCrys[Crystal] == 4244 or DonateCrys[Crystal] == 4245) then
                            AddPoints = AddPoints + tcount * math.floor(4000 / (player:getRank() * 12 - 16));
                        else
                            AddPoints = AddPoints + tcount * math.floor(4000 / (player:getRank() * 12 - 12));
                        end
                    end
                end

                if (player:getRank() ~= 1 and player:getRankPoints() < 4000) then
                    if (AddPoints + player:getRankPoints() >= 4000) then
                        newpoint = (AddPoints + player:getRankPoints()) - 4000;
                        player:addCP(newpoint);
                        player:setRankPoints(4000);
                        player:showText(npc,CONQUEST + 44);
                    else
                        --printf("point: %u",AddPoints);
                        player:addRankPoints(AddPoints);
                        player:showText(npc,CONQUEST + 45);
                    end
                    player:tradeComplete();
                end
            end
        end

        if (item >= 15761 and item <= 15763) then -- All guard can recharge ring - I can't read number of charge atm
            if (trade:hasItemQty(item,1) and trade:getItemCount() == 1 and player:getVar("CONQUEST_RING_RECHARGE") < os.time() and
            (ALLOW_MULTIPLE_EXP_RINGS == 1 or checkConquestRing(player) < 2)) then
                if (myCP >= XpRing[item - 15760]) then

                    player:delCP(XpRing[item - 15760]);
                    player:tradeComplete();
                    player:addItem(item);
                    player:setVar("CONQUEST_RING_RECHARGE",getConquestTally());
                    player:showText(npc,CONQUEST + 58,item,XpRing[item - 15760],RingCharg[(item - 15760)]);
                else
                    player:showText(npc,CONQUEST + 55,item,XpRing[item - 15760]);
                end
         else
            -- TODO: Verify that message is retail correct.
            -- This gives feedback on a failure at least, and is grouped with the recharge messages.  Confident enough for a commit.
            player:showText(npc,CONQUEST+56,item); -- "Please be aware that you can only purchase or recharge <item> once during the period between each conquest results tally.
            end
        end
    end

end;

function updateConquestGuard(player,csid,option,size,inventory)
    if (option >= 32768 and option <= 32944) then
        for Item = 1,size,3 do
            if (option == inventory[Item]) then
                local CPVerify = 1;
                if (player:getCP() >= inventory[Item + 1]) then
                    CPVerify = 0;
                end;

                player:updateEvent(2,CPVerify,inventory[Item + 2]);
                break;
            end
        end
    end
end;

function finishConquestGuard(player,csid,option,size,inventory,guardnation)
    if (option == 1) then
        local duration = (player:getRank() + getNationRank(player:getNation()) + 3) * 3600;
        player:delStatusEffectSilent(dsp.effect.SIGIL);
        player:delStatusEffectSilent(dsp.effect.SANCTION);
        player:delStatusEffectSilent(dsp.effect.SIGNET);
        player:addStatusEffect(dsp.effect.SIGNET,0,0,duration); -- Grant Signet
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

                    local itemCP;
                    if (player:getNation() == guardnation or guardnation == dsp.nation.OTHER) then
                        itemCP = inventory[Item + 1];
                    else
                        if (inventory[Item + 1] <= 8000) then
                            itemCP = inventory[Item + 1] * 2;
                        else
                            itemCP = inventory[Item + 1] + 8000;
                        end;
                    end;

                    if (player:hasItem(inventory[Item + 2]) == false and player:getCP() >= itemCP) then
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

-------------------------------------------------------------------------
-- function suppliesFresh(player) [NEED COMMAND] 0: delete old supply after weekly conquest tally
-------------------------------------------------------------------------

function supplyRunFresh(player)

    local fresh = player:getVar("supplyQuest_fresh");
    local started = player:getVar("supplyQuest_started");
    local region = player:getVar("supplyQuest_region");

    if ((fresh <= os.time() and (region > 0 or player:hasKeyItem(dsp.ki.RONFAURE_SUPPLIES))) or
      started <= 400) then -- Legacy support to remove supplies from the old system, otherwise they'd never go away.
        return 0;
    else
        return 1;
    end;

end;

----------------------------------------------------------------
-- function getArg1(player)
-----------------------------------------------------------------

windurst_bastok_ally = 0;
sandy_windurst_ally = 0;
sandy_bastok_ally = 0;

function getArg1(guardnation,player)

    local pNation = player:getNation();
    local output = 0;
    local signet = 0;

    if (guardnation == dsp.nation.WINDURST) then
        output = 33;
    elseif (guardnation == dsp.nation.SANDORIA) then
        output = 1;
    elseif (guardnation == dsp.nation.BASTOK) then
        output = 17;
    end

    if (guardnation == pNation) then
        signet = 0;
    elseif (pNation == dsp.nation.WINDURST) then
        if (guardnation == dsp.nation.BASTOK and windurst_bastok_ally == 1) or (guardnation == dsp.nation.SANDORIA and sandy_windurst_ally == 1) then
            signet = 1;
        else
            signet = 7;
        end
    elseif (pNation == dsp.nation.BASTOK) then
        if (guardnation == dsp.nation.WINDURST and windurst_bastok_ally == 1) or (guardnation == dsp.nation.SANDORIA and sandy_bastok_ally == 1) then
            signet = 2;
        else
            signet = 7;
        end
    elseif (pNation == dsp.nation.SANDORIA) then
        if (guardnation == dsp.nation.WINDURST and sandy_windurst_ally == 1) or (guardnation == dsp.nation.BASTOK and sandy_bastok_ally == 1) then
            signet = 4;
        else
            signet = 7;
        end
    end

    if (guardnation == dsp.nation.OTHER) then
        output = (pNation * 16) + (3 * 256)  + 65537;
    else
        output = output + 256 * signet;
    end

    return output;

end;

------------------------------------------------
-- function getExForceAvailable(guardnation,player) Expeditionary Force Menu [NOT IMPLEMENTED]
------------------------------------------------

function getExForceAvailable(guardnation,player)
    return 0;
end;

------------------------------------------------
-- function conquest_ranking() computes part of argument 3 for gate guard events.
-- it represents the conquest standing of the 3 nations. Verified.
------------------------------------------------

function conquestRanking()
    return getNationRank(dsp.nation.SANDORIA) + 4 * getNationRank(dsp.nation.BASTOK) + 16 * getNationRank(dsp.nation.WINDURST);
end;

----------------------------------------------------------------
-- function getSupplyAvailable(nation,player) produces the supply quest mask for the nation based on the current conquest standings.
----------------------------------------------------------------

function getSupplyAvailable(nation,player)

    local mask = 2130706463;

    if (player:getVar("supplyQuest_started") == vanaDay()) then
        mask = 4294967295; -- Need to wait 1 vanadiel day
    end

    for nb = 0,15 do
        if (player:hasKeyItem(getSupplyKey(nb))) then
            mask = -1; -- if you have supply run already activated
        end
    end
    if (player:hasKeyItem(getSupplyKey(18))) then -- we need to skip 16 and 17 for now
        mask = -1;
    end

    if (mask ~= -1 and mask ~= 4294967295) then
        for i = 0,18 do
            if (GetRegionOwner(i) ~= nation or
               i == 16 or
               (i == 18 and player:hasCompletedMission(COP,DARKNESS_NAMED) == false)) then
                mask = mask + 2^(i + 5);
            end
        end
    end

    return mask;

end;

----------------------------------------------------------------
-- function getArg6(player) computes argument 6 for gate guard events. This number encodes a player's rank and nationality:
-- bits 1-4 encode the rank of the player (verified that bit 4 is part of the rank number so ranks could have gone up to 31.)
-- bits 5-6 seem to encode the citizenship as below. This part needs more testing and verification.
-----------------------------------------------------------------

function getArg6(player)

    local output = player:getRank();
    local nation = player:getNation();

    if (nation == dsp.nation.SANDORIA) then
        return output;
    elseif (nation == dsp.nation.BASTOK) then
        return output + 32;
    elseif (nation == dsp.nation.WINDURST) then
        return output + 64;

    end

end;

------------------------------------------------
-- function getRewardExForce(guardnation,player) Expeditionary Force Reward [NOT IMPLEMENTED]
------------------------------------------------

function getRewardExForce(guardnation,player)
    return 0;
end;

------------------------------------------------
-- function getKeySupply(region)
------------------------------------------------

function getSupplyKey(region)

    if (region <= 9) then
        return 75 + region;
    elseif (region == 10) then
        return 124;
    elseif (region <= 13) then
        return 74 + region;
    elseif (region <= 15) then
        return 248 + region;
    elseif (region == 18) then
        return 620;
    end

end;

-----------------------------------------------------------------
-- giltosetHP(player) returns the amount of gil it costs a player to set a homepoint at a foreign outpost/border guard.
-----------------------------------------------------------------

function giltosetHP(guardnation,player)

    local rank = player:getRank();

    if (getArg1(guardnation,player) < 0x700) then -- determine ifplayer is in same or allied nation as guard
        HPgil = 0;
    else
        if (rank <= 5) then
            HPgil = 100 * 2^(rank - 1);
        else
            HPgil = 800 * rank - 2400;
        end
    end

    return HPgil;

end;

-----------------------------------------------------------------
-- function hasOutpost(player, region) returns 1 ifthe player has the outpost of the indicated region under current allegiance.
-----------------------------------------------------------------

function hasOutpost(player, region)

    local nation = player:getNation()
    local bit = {};

    if (nation == dsp.nation.BASTOK) then
        supply_quests = player:getNationTeleport(dsp.nation.BASTOK);
    elseif (nation == dsp.nation.SANDORIA) then
        supply_quests = player:getNationTeleport(dsp.nation.SANDORIA);
    elseif (nation == dsp.nation.WINDURST) then
        supply_quests = player:getNationTeleport(dsp.nation.WINDURST);
    end;

    for i = 23,5,-1 do
        twop = 2^i
        if (supply_quests >= twop) then
            bit[i]=1;
            supply_quests = supply_quests - twop;
        else
            bit[i]=0;
        end;
        --printf("bit %u: %u \n",i,bit[i]);
    end;

    return bit[region];

end;

-----------------------------------------------------------------
-- function OP_TeleFee(player,region)
-----------------------------------------------------------------

function OP_TeleFee(player,region)

    if (hasOutpost(player, region+5) == 1) then
        if (GetRegionOwner(region) == player:getNation()) then
            return tpFees[region + 1];
        else
            return tpFees[region + 1] * 3;
        end
    else
        return 0;
    end

end;

-----------------------------------------------------------------
-- Teleport Outpost > Nation
-----------------------------------------------------------------

function toHomeNation(player)

    if (player:getNation() == dsp.nation.BASTOK) then
        player:setPos(89, 0 , -66, 0, 234);
    elseif (player:getNation() == dsp.nation.SANDORIA) then
        player:setPos(49, -1 , 29, 164, 231);
    else
        player:setPos(193, -12 , 220, 64, 240);
    end

end;

-----------------------------------------------------------------
-- function getTeleAvailable(nation)
-----------------------------------------------------------------

function getTeleAvailable(nation)

    local mask = 2145386527;

    for i = 5,23 do
        if (GetRegionOwner(i - 5) ~= nation) then
            mask = mask + 2^i;
        end;
    end

    return mask;

end;

---------------------------------
-- Teleport Nation > Outpost
---------------------------------

function toOutpost(player,option)
-- Coordinates marked {R} have been obtained by packet capture from retail. Don't change them.

    -- Ronfaure
    if (option == 5) then
        player:setPos(-437.688, -20.255, -219.227, 124, 100); -- {R}
    -- Zulkheim
    elseif (option == 6) then
        player:setPos(148.231, -7.975 , 93.479, 154, 103);       -- {R}
    -- Norvallen
    elseif (option == 7) then
        player:setPos(62.030, 0.463, -2.025, 67, 104);           -- {R}
    -- Gustaberg
    elseif (option == 8) then
        player:setPos(-580.161, 39.578, 62.68, 89, 106);      -- {R}
    -- Derfland
    elseif (option == 9) then
        player:setPos(465.820, 23.625, 423.164, 29, 109);       -- {R}
    -- Sarutabaruta
    elseif (option == 10) then
        player:setPos(-17.921, -13.335, 318.156, 254, 115);      -- {R}
    -- Kolshushu
    elseif (option == 11) then
        player:setPos(-480.237, -30.943, 58.079, 62, 118);      -- {R}
    -- Aragoneu
    elseif (option == 12) then
        player:setPos(-297.047, 16.988, 418.026, 225, 119);      -- {R}
    -- Fauregandi
    elseif (option == 13) then
        player:setPos(-18.690, -60.048, -109.243, 100, 111);  -- {R}
    -- Valdeaunia
    elseif (option == 14) then
        player:setPos(211.210, -24.016, -207.338, 160, 112);  -- {R}
    -- Qufim Island
    elseif (option == 15) then
        player:setPos(-243.049, -19.983, 306.712, 71, 126);   -- {R}
    -- Li'Telor
    elseif (option == 16) then
        player:setPos(-37.669, 0.419, -141.216, 69, 121);      -- {R}
    -- Kuzotz
    elseif (option == 17) then
        player:setPos(-249.983, 7.965, -252.976, 122, 114);   -- {R}
    -- Vollbow
    elseif (option == 18) then
        player:setPos(-176.360, 7.624, -63.580, 122, 113);      -- {R}
    -- Elshimo Lowlands
    elseif (option == 19) then
        player:setPos(-240.860, -0.031, -388.434, 64, 123);   -- {R}
    -- Elshimo Uplands
    elseif (option == 20) then
        player:setPos(207.821, -0.128, -86.623, 159, 124);      -- {R}
    -- Tu'Lia ?!
    elseif (option == 21) then
        player:setPos(4, -54, -600, 192, 130);                -- Dummied out?
    -- Tavnazia
    elseif (option == 23) then
        player:setPos(-535.861, -7.149, -53.628, 122, 24);    -- {R}
    end;
end;

-----------------------------------
-- Expeditionary Force
-- {Option,Quest,Zone,MenuMask,MinimumLevel,KeyItem} NOT USED
-----------------------------------
EXFORCE = {0x20006,ZULK_EF,103,0x000040,20,dsp.ki.ZULKHEIM_EF_INSIGNIA,
           0x20007,NORV_EF,104,0x000080,25,dsp.ki.NORVALLEN_EF_INSIGNIA,
           0x20009,DERF_EF,109,0x000200,25,dsp.ki.DERFLAND_EF_INSIGNIA,
           0x2000B,KOLS_EF,118,0x000800,20,dsp.ki.KOLSHUSHU_EF_INSIGNIA,
           0x2000C,ARAG_EF,119,0x001000,25,dsp.ki.ARAGONEU_EF_INSIGNIA,
           0x2000D,FAUR_EF,111,0x002000,35,dsp.ki.FAUREGANDI_EF_INSIGNIA,
           0x2000E,VALD_EF,112,0x004000,40,dsp.ki.VALDEAUNIA_EF_INSIGNIA,
           0x2000F,QUFI_EF,126,0x008000,25,dsp.ki.QUFIM_EF_INSIGNIA,
           0x20010,LITE_EF,121,0x010000,35,dsp.ki.LITELOR_EF_INSIGNIA,
           0x20011,KUZO_EF,114,0x020000,40,dsp.ki.KUZOTZ_EF_INSIGNIA,
           0x20012,VOLL_EF,113,0x040000,65,dsp.ki.VOLLBOW_EF_INSIGNIA,
           0x20013,ELLO_EF,123,0x080000,35,dsp.ki.ELSHIMO_LOWLANDS_EF_INSIGNIA,
           0x20014,ELUP_EF,124,0x100000,45,dsp.ki.ELSHIMO_UPLANDS_EF_INSIGNIA};


---------------------------------
--
---------------------------------

function getRegionalConquestOverseers(region)

switch (region): caseof {
  ---------------------------------
  [dsp.region.RONFAURE] = function (x) -- West Ronfaure (100)
  ---------------------------------
    --print("RONFAURE");

    local Doladepaiton = 17187523;

    npc  = {
    --
        Doladepaiton,dsp.nation.SANDORIA,        -- Doladepaiton, R.K.
        Doladepaiton+7,dsp.nation.SANDORIA,    -- Ballie, R.K.
        Doladepaiton+3,dsp.nation.SANDORIA,    -- Flag
        Doladepaiton+11,dsp.nation.SANDORIA,    -- Flag
    --
        Doladepaiton+1,dsp.nation.BASTOK,        -- Yoshihiro, I.M.
        Doladepaiton+8,dsp.nation.BASTOK,        -- Molting Moth, I.M.
        Doladepaiton+4,dsp.nation.BASTOK,        -- Flag
        Doladepaiton+13,dsp.nation.BASTOK,        -- Flag
    --
        Doladepaiton+2,dsp.nation.WINDURST,    -- Kyanta-Pakyanta, W.W.
        Doladepaiton+9,dsp.nation.WINDURST,    -- Tottoto, W.W.
        Doladepaiton+5,dsp.nation.WINDURST,    -- Flag
        Doladepaiton+13,dsp.nation.WINDURST,    -- Flag
    --
        Doladepaiton+6,dsp.nation.BEASTMEN,    -- Flag
        Doladepaiton+14,dsp.nation.BEASTMEN,    -- Flag
    --
        Doladepaiton+10,dsp.nation.OTHER,        -- Harvetour
    }
  end,

  ---------------------------------
  [dsp.region.ZULKHEIM] = function (x) -- Valkurm_Dunes (103)
  ---------------------------------
    --print("ZULKHEIM");

    local Quanteilleron = 17199707;

    npc  = {
    --
        Quanteilleron,dsp.nation.SANDORIA,        -- Quanteilleron, R.K.
        Quanteilleron+7,dsp.nation.SANDORIA,    -- Prunilla, R.K.
        Quanteilleron+3,dsp.nation.SANDORIA,    -- flag
        Quanteilleron+12,dsp.nation.SANDORIA,    -- flag
    --
        Quanteilleron+1,dsp.nation.BASTOK,        -- Tsunashige, I.M.
        Quanteilleron+8,dsp.nation.BASTOK,        -- Fighting Ant, I.M.
        Quanteilleron+4,dsp.nation.BASTOK,        -- flag
        Quanteilleron+13,dsp.nation.BASTOK,    -- flag
    --
        Quanteilleron+2,dsp.nation.WINDURST,    -- Nyata-Mobuta, W.W.
        Quanteilleron+9,dsp.nation.WINDURST,    -- Tebubu, W.W.
        Quanteilleron+5,dsp.nation.WINDURST,    -- flag
        Quanteilleron+14,dsp.nation.WINDURST,    -- flag
    --
        Quanteilleron+6,dsp.nation.BEASTMEN,    -- flag
        Quanteilleron+15,dsp.nation.BEASTMEN,    -- flag
    --
        Quanteilleron+10,dsp.nation.OTHER,        -- Medicine Axe
    }
  end,

  ---------------------------------
  [dsp.region.NORVALLEN] = function (x) -- Jugner_Forest (104)
  ---------------------------------
    --print("NORVALLEN");

    local Chaplion = 17203846;

    npc  = {
    --
        Chaplion,dsp.nation.SANDORIA,        -- Chaplion, R.K.
        Chaplion+7,dsp.nation.SANDORIA,    -- Taumiale, R.K.
        Chaplion+3,dsp.nation.SANDORIA,    -- flag
        Chaplion+11,dsp.nation.SANDORIA,    -- flag
    --
        Chaplion+1,dsp.nation.BASTOK,        -- Takamoto, I.M.
        Chaplion+8,dsp.nation.BASTOK,        -- Pure Heart, I.M.
        Chaplion+4,dsp.nation.BASTOK,        -- flag
        Chaplion+12,dsp.nation.BASTOK,        -- flag
    --
        Chaplion+2,dsp.nation.WINDURST,    -- Bubchu-Bibinchu, W.W.
        Chaplion+9,dsp.nation.WINDURST,    -- Geruru, W.W.
        Chaplion+5,dsp.nation.WINDURST,    -- flag
        Chaplion+13,dsp.nation.WINDURST,    -- flag
    --
        Chaplion+6,dsp.nation.BEASTMEN,    -- flag
        Chaplion+14,dsp.nation.BEASTMEN,    -- flag
    --
        Chaplion+10,dsp.nation.OTHER,        -- Mionie
    }
  end,

  ---------------------------------
  [dsp.region.GUSTABERG] = function (x) -- North_Gustaberg (106)
  ---------------------------------
    --print("GUSTABERG");

    local Ennigreaud = 17212058;

    npc  = {
    --
        Ennigreaud,dsp.nation.SANDORIA,    -- Ennigreaud, R.K.
        Ennigreaud+7,dsp.nation.SANDORIA,    -- Quellebie, R.K.
        Ennigreaud+3,dsp.nation.SANDORIA,    -- flag
        Ennigreaud+11,dsp.nation.SANDORIA,    -- flag
    --
        Ennigreaud+1,dsp.nation.BASTOK,    -- Shigezane, I.M.
        Ennigreaud+8,dsp.nation.BASTOK,    -- Heavy Fog, I.M.
        Ennigreaud+4,dsp.nation.BASTOK,    -- flag
        Ennigreaud+12,dsp.nation.BASTOK,    -- flag
    --
        Ennigreaud+2,dsp.nation.WINDURST,    -- Kuuwari-Aori, W.W.
        Ennigreaud+9,dsp.nation.WINDURST,    -- Butsutsu, W.W.
        Ennigreaud+5,dsp.nation.WINDURST,    -- flag
        Ennigreaud+13,dsp.nation.WINDURST,    -- flag
    --
        Ennigreaud+6,dsp.nation.BEASTMEN,    -- flag
        Ennigreaud+14,dsp.nation.BEASTMEN,    -- flag
    --
        Ennigreaud+10,dsp.nation.OTHER,    -- Kuleo
    }
  end,

  ---------------------------------
  [dsp.region.DERFLAND] = function (x) -- Pashhow_Marshlands (109)
  ---------------------------------
    --print("DERFLAND");

    local Mesachedeau = 17224324;

    npc  = {
    --
        Mesachedeau,dsp.nation.SANDORIA,        -- Mesachedeau, R.K.
        Mesachedeau+7,dsp.nation.SANDORIA,        -- Ioupie, R.K.
        Mesachedeau+3,dsp.nation.SANDORIA,        -- flag
        Mesachedeau+11,dsp.nation.SANDORIA,    -- flag
    --
        Mesachedeau+1,dsp.nation.BASTOK,        -- Souun, I.M.
        Mesachedeau+8,dsp.nation.BASTOK,        -- Sharp Tooth, I.M.
        Mesachedeau+4,dsp.nation.BASTOK,        -- flag
        Mesachedeau+12,dsp.nation.BASTOK,        -- flag
    --
        Mesachedeau+2,dsp.nation.WINDURST,        -- Mokto-Lankto, W.W.
        Mesachedeau+9,dsp.nation.WINDURST,        -- Shikoko, W.W.
        Mesachedeau+5,dsp.nation.WINDURST,        -- flag
        Mesachedeau+13,dsp.nation.WINDURST,    -- flag
    --
        Mesachedeau+6,dsp.nation.BEASTMEN,        -- flag
        Mesachedeau+14,dsp.nation.BEASTMEN,    -- flag
    --
        Mesachedeau+10,dsp.nation.OTHER,        -- Tahmasp
    }
  end,

  ---------------------------------
  [dsp.region.SARUTABARUTA] = function (x) -- West_Sarutabaruta (115)
  ---------------------------------
    --print("SARUTABARUTA");

    local Naguipeillont = 17248823;

    npc  = {
    --
        Naguipeillont,dsp.nation.SANDORIA,        -- Naguipeillont, R.K.
        Naguipeillont+7,dsp.nation.SANDORIA,    -- Banege, R.K.
        Naguipeillont+3,dsp.nation.SANDORIA,    -- flag
        Naguipeillont+11,dsp.nation.SANDORIA,    -- flag
    --
        Naguipeillont+1,dsp.nation.BASTOK,        -- Ryokei, I.M.
        Naguipeillont+8,dsp.nation.BASTOK,        -- Slow Axe, I.M.
        Naguipeillont+4,dsp.nation.BASTOK,        -- flag
        Naguipeillont+12,dsp.nation.BASTOK,    -- flag
    --
        Naguipeillont+2,dsp.nation.WINDURST,    -- Roshina-Kuleshuna, W.W.
        Naguipeillont+9,dsp.nation.WINDURST,    -- Darumomo, W.W.
        Naguipeillont+5,dsp.nation.WINDURST,    -- flag
        Naguipeillont+13,dsp.nation.WINDURST,    -- flag
    --
        Naguipeillont+6,dsp.nation.BEASTMEN,    -- flag
        Naguipeillont+14,dsp.nation.BEASTMEN,    -- flag
    --
        Naguipeillont+10,dsp.nation.OTHER,        -- Mahien-Uhien
    }
  end,

  ---------------------------------
  [dsp.region.KOLSHUSHU] = function (x) -- Buburimu_Peninsula (118)
  ---------------------------------
    --print("KOLSHUSHU");

    local Bonbavour = 17261148;

    npc  = {
    --
        Bonbavour,dsp.nation.SANDORIA,    -- Bonbavour, R.K.
        Bonbavour+7,dsp.nation.SANDORIA,    -- Craigine, R.K.
        Bonbavour+3,dsp.nation.SANDORIA,    -- flag
        Bonbavour+11,dsp.nation.SANDORIA,    -- flag
    --
        Bonbavour+1,dsp.nation.BASTOK,    -- Ishin, I.M.
        Bonbavour+8,dsp.nation.BASTOK,    -- Wise Turtle, I.M.
        Bonbavour+4,dsp.nation.BASTOK,    -- flag
        Bonbavour+12,dsp.nation.BASTOK,    -- flag
    --
        Bonbavour+2,dsp.nation.WINDURST,    -- Ganemu-Punnemu, W.W.
        Bonbavour+9,dsp.nation.WINDURST,    -- Mashasha, W.W.
        Bonbavour+5,dsp.nation.WINDURST,    -- flag
        Bonbavour+13,dsp.nation.WINDURST,    -- flag
    --
        Bonbavour+6,dsp.nation.BEASTMEN,    -- flag
        Bonbavour+14,dsp.nation.BEASTMEN,    -- flag
    --
        Bonbavour+10,dsp.nation.OTHER,        -- Lobho Ukipturi
    }
  end,

  ---------------------------------
  [dsp.region.ARAGONEU] = function (x) -- Meriphataud_Mountains (119)
  ---------------------------------
    --print("ARAGONEU");

    local Chegourt = 17265269;

    npc  = {
    --
        Chegourt,dsp.nation.SANDORIA,    -- Chegourt, R.K.
        Chegourt+7,dsp.nation.SANDORIA,    -- Buliame, R.K.
        Chegourt+3,dsp.nation.SANDORIA,    -- flag
        Chegourt+11,dsp.nation.SANDORIA,    -- flag
    --
        Chegourt+1,dsp.nation.BASTOK,    -- Akane, I.M.
        Chegourt+8,dsp.nation.BASTOK,    -- Three Steps, I.M.
        Chegourt+4,dsp.nation.BASTOK,    -- flag
        Chegourt+12,dsp.nation.BASTOK,    -- flag
    --
        Chegourt+2,dsp.nation.WINDURST,    -- Donmo-Boronmo, W.W.
        Chegourt+9,dsp.nation.WINDURST,    -- Daruru, W.W.
        Chegourt+5,dsp.nation.WINDURST,    -- flag
        Chegourt+13,dsp.nation.WINDURST,    -- flag
    --
        Chegourt+6,dsp.nation.BEASTMEN,    -- flag
        Chegourt+14,dsp.nation.BEASTMEN,    -- flag
    --
        Chegourt+10,dsp.nation.OTHER,        -- Mushosho
    }
  end,

  ---------------------------------
  [dsp.region.FAUREGANDI] = function (x) -- Beaucedine_Glacier (111)
  ---------------------------------
    --print("FAUREGANDI");

    local Parledaire = 17232207;

    npc  = {
    --
        Parledaire,dsp.nation.SANDORIA,        -- Parledaire, R.K.
        Parledaire+7,dsp.nation.SANDORIA,        -- Leaufetie, R.K.
        Parledaire+3,dsp.nation.SANDORIA,        -- flag
        Parledaire+11,dsp.nation.SANDORIA,        -- flag
    --
        Parledaire+1,dsp.nation.BASTOK,        -- Akane, I.M.
        Parledaire+8,dsp.nation.BASTOK,        -- Rattling Rain, I.M.
        Parledaire+4,dsp.nation.BASTOK,        -- flag
        Parledaire+12,dsp.nation.BASTOK,        -- flag
    --
        Parledaire+2,dsp.nation.WINDURST,        -- Ryunchi-Pauchi, W.W.
        Parledaire+9,dsp.nation.WINDURST,        -- Chopapa, W.W.
        Parledaire+5,dsp.nation.WINDURST,        -- flag
        Parledaire+13,dsp.nation.WINDURST,        -- flag
    --
        Parledaire+6,dsp.nation.BEASTMEN,        -- flag
        Parledaire+14,dsp.nation.BEASTMEN,        -- flag
    --
        Parledaire+10,dsp.nation.OTHER,        -- Gueriette
    }
  end,

  ---------------------------------
  [dsp.region.VALDEAUNIA] = function (x) -- Xarcabard (112)
  ---------------------------------
    --print("VALDEAUNIA");

    local Jeantelas = 17236288;

    npc  = {
    --
        Jeantelas,dsp.nation.SANDORIA,            -- Jeantelas, R.K.
        Jeantelas+7,dsp.nation.SANDORIA,        -- Pilcha, R.K.
        Jeantelas+3,dsp.nation.SANDORIA,        -- flag
        Jeantelas+11,dsp.nation.SANDORIA,        -- flag
    --
        Jeantelas+1,dsp.nation.BASTOK,            -- Kaya, I.M.
        Jeantelas+8,dsp.nation.BASTOK,            -- Heavy Bear, I.M.
        Jeantelas+4,dsp.nation.BASTOK,            -- flag
        Jeantelas+12,dsp.nation.BASTOK,        -- flag
    --
        Jeantelas+2,dsp.nation.WINDURST,        -- Magumo-Yagimo, W.W.
        Jeantelas+9,dsp.nation.WINDURST,        -- Tememe, W.W.
        Jeantelas+5,dsp.nation.WINDURST,        -- flag
        Jeantelas+13,dsp.nation.WINDURST,        -- flag
    --
        Jeantelas+6,dsp.nation.BEASTMEN,        -- flag
        Jeantelas+14,dsp.nation.BEASTMEN,        -- flag
    --
        Jeantelas+10,dsp.nation.OTHER,            -- Pelogrant
    }
  end,

  ---------------------------------
  [dsp.region.QUFIMISLAND] = function (x) -- Qufim_Island (126)
  ---------------------------------
    --print("QUFIMISLAND");

    local Pitoire = 17293714;

    npc  = {
    --
        Pitoire,dsp.nation.SANDORIA,    -- Pitoire, R.K.
        Pitoire+7,dsp.nation.SANDORIA,    -- Matica, R.K.
        Pitoire+3,dsp.nation.SANDORIA,    -- flag
        Pitoire+11,dsp.nation.SANDORIA,    -- flag
    --
        Pitoire+1,dsp.nation.BASTOK,    -- Sasa, I.M.
        Pitoire+8,dsp.nation.BASTOK,    -- Singing Blade, I.M.
        Pitoire+4,dsp.nation.BASTOK,    -- flag
        Pitoire+12,dsp.nation.BASTOK,    -- flag
    --
        Pitoire+2,dsp.nation.WINDURST,    -- Tsonga-Hoponga, W.W.
        Pitoire+9,dsp.nation.WINDURST,    -- Numumu, W.W.
        Pitoire+5,dsp.nation.WINDURST,    -- flag
        Pitoire+13,dsp.nation.WINDURST,    -- flag
    --
        Pitoire+6,dsp.nation.BEASTMEN,    -- flag
        Pitoire+14,dsp.nation.BEASTMEN,    -- flag
    --
        Pitoire+10,dsp.nation.OTHER,        -- Jiwon
    }
  end,

  ---------------------------------
  [dsp.region.LITELOR] = function (x) -- The_Sanctuary_of_ZiTah (121)
  ---------------------------------
    --print("LITELOR");

    local Credaurion = 17273363;

    npc  = {
    --
        Credaurion,dsp.nation.SANDORIA,        -- Credaurion, R.K.
        Credaurion+7,dsp.nation.SANDORIA,        -- Limion, R.K.
        Credaurion+3,dsp.nation.SANDORIA,        -- flag
        Credaurion+11,dsp.nation.SANDORIA,        -- flag
    --
        Credaurion+1,dsp.nation.BASTOK,        -- Calliope, I.M.
        Credaurion+8,dsp.nation.BASTOK,        -- Dedden, I.M.
        Credaurion+4,dsp.nation.BASTOK,        -- flag
        Credaurion+12,dsp.nation.BASTOK,        -- flag
    --
        Credaurion+2,dsp.nation.WINDURST,        -- Ajimo-Majimo, W.W.
        Credaurion+9,dsp.nation.WINDURST,        -- Ochocho, W.W.
        Credaurion+5,dsp.nation.WINDURST,        -- flag
        Credaurion+13,dsp.nation.WINDURST,        -- flag
    --
        Credaurion+6,dsp.nation.BEASTMEN,        -- flag
        Credaurion+14,dsp.nation.BEASTMEN,        -- flag
    --
        Credaurion+10,dsp.nation.OTHER,        -- Kasim
    }
  end,

  ---------------------------------
  [dsp.region.KUZOTZ] = function (x) -- Eastern_Altepa_Desert (114)
  ---------------------------------
    --print("KUZOTZ");

    local Eaulevisat = 17244625;

    npc  = {
    --
        Eaulevisat,dsp.nation.SANDORIA,    -- Eaulevisat, R.K.
        Eaulevisat+7,dsp.nation.SANDORIA,    -- Laimeve, R.K.
        Eaulevisat+3,dsp.nation.SANDORIA,    -- flag
        Eaulevisat+11,dsp.nation.SANDORIA,    -- flag
    --
        Eaulevisat+1,dsp.nation.BASTOK,    -- Lindgard, I.M.
        Eaulevisat+8,dsp.nation.BASTOK,    -- Daborn, I.M.
        Eaulevisat+4,dsp.nation.BASTOK,    -- flag
        Eaulevisat+12,dsp.nation.BASTOK,    -- flag
    --
        Eaulevisat+2,dsp.nation.WINDURST,    -- Variko-Njariko, W.W.
        Eaulevisat+9,dsp.nation.WINDURST,    -- Sahgygy, W.W.
        Eaulevisat+5,dsp.nation.WINDURST,    -- flag
        Eaulevisat+13,dsp.nation.WINDURST,    -- flag
    --
        Eaulevisat+6,dsp.nation.BEASTMEN,    -- flag
        Eaulevisat+14,dsp.nation.BEASTMEN,    -- flag
    --
        Eaulevisat+10,dsp.nation.OTHER,    -- Sowande
    }
  end,

  ---------------------------------
  [dsp.region.VOLLBOW] = function (x) -- Cape_Teriggan (113)
  ---------------------------------
    --print("VOLLBOW");

    local Salimardi = 17240472;

    npc  = {
    --
        Salimardi,dsp.nation.SANDORIA,    -- Salimardi, R.K.
        Salimardi+7,dsp.nation.SANDORIA,    -- Paise, R.K.
        Salimardi+3,dsp.nation.SANDORIA,    -- flag
        Salimardi+11,dsp.nation.SANDORIA,    -- flag
    --
        Salimardi+1,dsp.nation.BASTOK,    -- Sarmistha, I.M.
        Salimardi+8,dsp.nation.BASTOK,    -- Dultwa, I.M.
        Salimardi+4,dsp.nation.BASTOK,    -- flag
        Salimardi+12,dsp.nation.BASTOK,    -- flag
    --
        Salimardi+2,dsp.nation.WINDURST,    -- Voranbo-Natanbo, W.W.
        Salimardi+9,dsp.nation.WINDURST,    -- Orukeke, W.W.
        Salimardi+5,dsp.nation.WINDURST,    -- flag
        Salimardi+13,dsp.nation.WINDURST,    -- flag
    --
        Salimardi+6,dsp.nation.BEASTMEN,    -- flag
        Salimardi+14,dsp.nation.BEASTMEN,    -- flag
    --
        Salimardi+10,dsp.nation.OTHER,        -- Bright Moon
    }
  end,

  ---------------------------------
  [dsp.region.ELSHIMOLOWLANDS] = function (x) -- Yuhtunga_Jungle (123)
  ---------------------------------
    --print("ELSHIMOLOWLANDS");

    local Zorchorevi = 17281598;

    npc  = {
    --
        Zorchorevi,dsp.nation.SANDORIA,    -- Zorchorevi, R.K.
        Zorchorevi+7,dsp.nation.SANDORIA,    -- Mupia, R.K.
        Zorchorevi+3,dsp.nation.SANDORIA,    -- flag
        Zorchorevi+11,dsp.nation.SANDORIA,    -- flag
    --
        Zorchorevi+1,dsp.nation.BASTOK,    -- Mahol, I.M.
        Zorchorevi+8,dsp.nation.BASTOK,    -- Bammiro, I.M.
        Zorchorevi+4,dsp.nation.BASTOK,    -- flag
        Zorchorevi+12,dsp.nation.BASTOK,    -- flag
    --
        Zorchorevi+2,dsp.nation.WINDURST,    -- Uphra-Kophra, W.W.
        Zorchorevi+9,dsp.nation.WINDURST,    -- Richacha, W.W.
        Zorchorevi+5,dsp.nation.WINDURST,    -- flag
        Zorchorevi+13,dsp.nation.WINDURST,    -- flag
    --
        Zorchorevi+6,dsp.nation.BEASTMEN,    -- flag
        Zorchorevi+14,dsp.nation.BEASTMEN,    -- flag
    --
        Zorchorevi+10,dsp.nation.OTHER,        -- Robino-Mobino
    }
  end,

  ---------------------------------
  [dsp.region.ELSHIMOUPLANDS] = function (x) -- Yhoator_Jungle (124)
  ---------------------------------
    --print("ELSHIMOUPLANDS");

    local Ilieumort = 17285648;

    npc  ={
    --
        Ilieumort,dsp.nation.SANDORIA,        -- Ilieumort, R.K.
        Ilieumort+7,dsp.nation.SANDORIA,    -- Emila, R.K.
        Ilieumort+3,dsp.nation.SANDORIA,    -- flag
        Ilieumort+11,dsp.nation.SANDORIA,    -- flag
    --
        Ilieumort+1,dsp.nation.BASTOK,        -- Mintoo, I.M.
        Ilieumort+8,dsp.nation.BASTOK,        -- Guddal, I.M.
        Ilieumort+4,dsp.nation.BASTOK,        -- flag
        Ilieumort+12,dsp.nation.BASTOK,    -- flag
    --
        Ilieumort+2,dsp.nation.WINDURST,    -- Etaj-Pohtaj, W.W.
        Ilieumort+9,dsp.nation.WINDURST,    -- Ghantata, W.W.
        Ilieumort+5,dsp.nation.WINDURST,    -- flag
        Ilieumort+13,dsp.nation.WINDURST,    -- flag
    --
        Ilieumort+6,dsp.nation.BEASTMEN,    -- flag
        Ilieumort+14,dsp.nation.BEASTMEN,    -- flag
    --
        Ilieumort+10,dsp.nation.OTHER,        -- Mugha Dovajaiho
    }
  end,

  ---------------------------------
  [dsp.region.TULIA] = function (x) -- RuAun_Gardens (130)
  ---------------------------------
    --print("TULIA");

    local RuAun_Banner = 17310080;

    npc  = {
    --
        RuAun_Banner,dsp.nation.SANDORIA,        -- flag
    --
        RuAun_Banner+1,dsp.nation.BASTOK,        -- flag
    --
        RuAun_Banner+2,dsp.nation.WINDURST,    -- flag
    --
        RuAun_Banner+3,dsp.nation.BEASTMEN,    -- flag
    }
  end,

  ---------------------------------
  [dsp.region.MOVALPOLOS] = function (x) -- Oldton_Movalpolos
  ---------------------------------
    --print("MOVALPOLOS");

    local Oldton_Banner_Offset = 16822509;

    npc  = {
    --
        Oldton_Banner_Offset,dsp.nation.SANDORIA,        -- flag
    --
        Oldton_Banner_Offset+1,dsp.nation.BASTOK,        -- flag
    --
        Oldton_Banner_Offset+2,dsp.nation.WINDURST,    -- flag
    --
        Oldton_Banner_Offset+3,dsp.nation.BEASTMEN,    -- flag
    }
  end,

  ---------------------------------
  [dsp.region.TAVNAZIANARCH] = function (x) -- Lufaise_Meadows
  ---------------------------------
    --print("TAVNAZIA");

    local Jemmoquel = 16875865;

    npc  = {
    --
        Jemmoquel,dsp.nation.SANDORIA,        -- Jemmoquel, R.K.
        Jemmoquel+7,dsp.nation.SANDORIA,    -- Chilaumme, R.K.
        Jemmoquel+3,dsp.nation.SANDORIA,    -- flag
        Jemmoquel+11,dsp.nation.SANDORIA,    -- flag
    --
        Jemmoquel+1,dsp.nation.BASTOK,        -- Yoram, I.M.
        Jemmoquel+8,dsp.nation.BASTOK,        -- Ghost Talker, I.M.
        Jemmoquel+4,dsp.nation.BASTOK,        -- flag
        Jemmoquel+12,dsp.nation.BASTOK,    -- flag
    --
        Jemmoquel+2,dsp.nation.WINDURST,    -- Teldo-Moroldo, W.W.
        Jemmoquel+9,dsp.nation.WINDURST,    -- Cotete, W.W.
        Jemmoquel+5,dsp.nation.WINDURST,    -- flag
        Jemmoquel+13,dsp.nation.WINDURST,    -- flag
    --
        Jemmoquel+6,dsp.nation.BEASTMEN,    -- flag
        Jemmoquel+14,dsp.nation.BEASTMEN,    -- flag
    --
        Jemmoquel+10,dsp.nation.OTHER,        -- Jersey
    }
  end,
  }

 return npc;
end;

-----------------------------------
--
-----------------------------------

function SetRegionalConquestOverseers(region)

    local npclist = getRegionalConquestOverseers(region);
    local nation  = GetRegionOwner(region);

    for i = 1, #npclist, 2 do
        local npc = GetNPCByID(npclist[i]);

        if (npc ~= nil) then
            if (npclist[i+1] == nation) then
                npc:setStatus(0);
            else
                npc:setStatus(2);
            end

            if (npclist[i+1] == dsp.nation.OTHER) then
                if (nation ~= dsp.nation.BEASTMEN) then
                    npc:setStatus(0);
                else
                    npc:setStatus(2);
                end
            end
    end
    end
end;

-----------------------------------
-- checkConquestRing
-----------------------------------

function checkConquestRing(player)
   local count = 0;

   -- If not enabled by admin, do a count on Chariot, Empress, and Emperor Band
   if (ALLOW_MULTIPLE_EXP_RINGS ~= 1) then
      for i=15761,15763 do
         if (player:hasItem(i) == true) then
            count = count + 1;
         end
      end
   end

   -- One exp ring purchasable per conquest tally
   if (BYPASS_EXP_RING_ONE_PER_WEEK ~= 1 and player:getVar("CONQUEST_RING_TIMER") > os.time()) then
      count = 3;
   end

   return count;
end;

-----------------------------------
-- conquestUpdate
-----------------------------------

function conquestUpdate(zone, player, updateType, messageBase)

    local ranking = getConquestBalance();

    if (updateType == CONQUEST_TALLY_START) then
        player:messageText(player, messageBase, 5);
    elseif (updateType == CONQUEST_TALLY_END) then
        --Tallying conquest results...
        player:messageText(player, messageBase+1, 5);
        -- This region is currently under x control.
        local owner = GetRegionOwner(zone:getRegionID());
        if (owner <= 3) then
            player:messageText(player, messageBase+2+owner, 5);
        else
            player:messageText(player, messageBase+6, 5);
        end

        local offset = 0;
        if (bit.band(ranking, 0x03) == 0x01) then
            offset = offset + 7; -- 7
            if (bit.band(ranking, 0x30) == 0x10) then
                offset = offset + 1; -- 8
                if (bit.band(ranking, 0x0C) == 0x0C) then
                    offset = offset + 1; -- 9
                end
            elseif (bit.band(ranking, 0x0C) == 0x08) then
                offset = offset + 3; -- 10
                if (bit.band(ranking, 0x30) == 0x30) then
                    offset = offset + 1; -- 11
                end
            elseif (bit.band(ranking, 0x0C) == 0x04) then
                offset = offset + 6; -- 13
            end
        elseif (bit.band(ranking, 0x0C) == 0x04) then
            offset = offset + 15; -- 15
            if (bit.band(ranking, 0x30) == 0x02) then
                offset = offset + 3; -- 18
                if (bit.band(ranking, 0x03) == 0x03) then
                    offset = offset + 1; -- 19
                end
            elseif (bit.band(ranking, 0x30) == 0x10) then
                offset = offset + 6; -- 21
            end
        elseif (bit.band(ranking, 0x30) == 0x10) then
            offset = offset + 23; -- 23
            if (bit.band(ranking, 0x0C) == 0x08) then
                offset = offset + 3; -- 26
                if (bit.band(ranking, 0x30) == 0x30) then
                    offset = offset + 1; -- 27
                end
            end
        end
        -- Global balance of power:
        player:messageText(player, messageBase+offset, 5);

        if (isConquestAlliance()) then
            -- have formed an alliance.
            if (bit.band(ranking, 0x03) == 0x01) then
                player:messageText(player, messageBase+50, 5);
            elseif (bit.band(ranking, 0x0C) == 0x04) then
                player:messageText(player, messageBase+51, 5);
            elseif (bit.band(ranking, 0x30) == 0x10) then
                player:messageText(player, messageBase+52, 5);
            end
        end
    elseif (updateType == CONQUEST_UPDATE) then
        -- Conquest update: This region is currently under x control.
        local owner = GetRegionOwner(zone:getRegionID());
        if (owner <= 3) then
            player:messageText(player, messageBase+32+owner, 5);
        else
            player:messageText(player, messageBase+31, 5);
        end

        local influence = GetRegionInfluence(zone:getRegionID());

        if (influence >= 64) then
            -- The beastmen are on the rise.
            player:messageText(player, messageBase+37, 5);
        elseif (influence == 0) then
            -- All three nations are at a deadlock.
            player:messageText(player, messageBase+36, 5);
        else
            local sandoria = bit.band(influence, 0x03);
            local bastok = bit.rshift(bit.band(influence, 0x0C),2);
            local windurst = bit.rshift(bit.band(influence, 0x30),4);

            -- Regional influence: San d'Oria
            player:messageText(player, messageBase+41 - sandoria, 5);
            -- Bastok
            player:messageText(player, messageBase+45 - bastok, 5);
            -- Windurst
            player:messageText(player, messageBase+49 - windurst, 5);
        end

        if (isConquestAlliance()) then
            --are currently allied.
            if (bit.band(ranking, 0x03) == 0x01) then
                player:messageText(player, messageBase+53, 5);
            elseif (bit.band(ranking, 0x0C) == 0x04) then
                player:messageText(player, messageBase+54, 5);
            elseif (bit.band(ranking, 0x30) == 0x10) then
                player:messageText(player, messageBase+55, 5);
            end
        end
    end
end;
